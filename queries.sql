Q01. Active drivers count
select count(*) active_driver_count
from driver
where left_date is null;

Q02 Total platform  from successfull payments.
select coalesce(sum(amount), 0) as total_gmv_eur
from payment
where lower(trim(status)) = 'succeeded';


Q03 Total refunded payments
select coalesce(sum(amount), 0) as total_gmv_eur
from payment
where lower(trim(status)) = 'refunded';

Q04 Customer counts by type
select customer_type, 
count(*) as customer_count
from customer
group by customer_type
order by customer_count desc, customer_type asc
limit 5;


Q05 Count distinct eligible rider customers
select 
count(distinct rider_customer_id) as affected_rider_customers
from trip
where lower(trim(status)) in ('cancelled_by_rider',
							  'cancelled_by_driver',
							  'aborted',
							  'no_show',
							  'noshow');


Q06 Busiest pickup zones
select table_name, column_name
from information_schema.columns
where table_schema = 'public'
and table_name in ('trip', 'payment')
order by table_name, ordinal_position;

 
Q07 Average successful ride fare by source system
SELECT
    t.source_system,
    ROUND(AVG(p.amount), 2) AS avg_ride_fare_eur
FROM trip t
JOIN payment p
    ON p.service_id = t.trip_id::text
WHERE LOWER(TRIM(p.status)) = 'succeeded'
  AND LOWER(TRIM(p.service_type)) = 'ride'
  AND COALESCE(p.payment_correction_flag, FALSE) = FALSE
GROUP BY t.source_system
ORDER BY avg_ride_fare_eur DESC, t.source_system ASC
LIMIT 5;


Q08 Payment success rate by corrected service
select case
		when payment_correction_flag = true 
		then 'package'
		else lower(trim(p.service_type))
		end as service_type_corrected,
		count(*) as total_attempts,
		count(*) filter (
		where lower(trim(status)) = 'succeeded')
		as successful_attempts,
		round(100.0 * count(*) filter(
where lower(trim(p.status)) = 'succeeded')
/nullif(count(*), 0), 2)
as success_rate_percent
from payment as p
group by 1
order by success_rate_percent desc,
		service_type_corrected asc
		limit 5;


Q09 Trip outcome breakdown

select case
			when lower(trim(status)) = 'finished' then 'completed'
			when lower(trim(status)) = 'aborted' then 'cancelled_by_rider'
			when lower(trim(status)) = 'noshow' then 'no_show'
			else lower(trim(status)) 
			end as status_normalized,
			count(*) as trip_count
	from trip
	group by 1
	order by status_normalized asc
	limit 10;


Q10 Premium fare zones
select initcap(replace(lower(trim(z.zone_name)), '-', ' '))
		as zone_name_canonical,
		count(distinct t.trip_id) as completed_ride_count,
		round(avg(p.amount), 2) as avg_fare_eur
		from trip as t
		join zone as z
		on z.zone_id = t.pickup_zone_id
		and z.source_system = t.source_system
		join payment as p
		on p.service_id = t.trip_id::text
		where lower(trim(t.status)) in ('completed', 'finished')
		and lower(trim(p.status)) = 'succeeded'
		and lower(trim(p.service_type)) = 'ride'
		and coalesce(p.payment_correction_flag, false) = false
		group by
		initcap(replace(lower(trim(z.zone_name)), '-', ' '))
		limit 10;


Q11 Top-rated drivers leaderboard
select 
d.driver_id, d.driver_name,
		round(
		avg(
		case when lower(trim(r.source_system)) = 'quickhop'
		then r.score / 2.0
		else r.score
		end ), 2 ) as avg_normalized_rating,
		count(distinct t.trip_id) as rated_ride_count
		from rating as r
		join trip as t
		on r.service_id = t.trip_id::text
		and r.source_system = t.source_system
		join driver as d
		on d.driver_id = t.driver_id
		and d.source_system = t.source_system
		where lower(trim(r.service_type)) = 'ride'
		group by
		d.driver_id,
		d.driver_name
		having count(distinct t.trip_id) >= 30
		order by
		avg_normalized_rating desc,
		d.driver_id asc
		limit 20;


Q12 Pending merge queue
select 
   g.customer_id as goride_customer_id,
   g.customer_id as quickhop_customer_id,
   g.phone_normalized,
   g.email
   from (
select
		customer_id,
		regexp_replace(phone, '[^0-9]', '', 'g') as phone_normalized, email, merged_into_customer_id
		from customer
		where lower(trim(source_system)) = 'goride'
		)
		as g
		join ( select
		customer_id,
		case
		when left(regexp_replace(phone, '[^0-9]', '', 'g'), 3 )
		= '490'
		then '49' || substring(regexp_replace(phone, '[^0-9]', '', 'g') from 4)
		else regexp_replace(phone, '[^0-9]', '', 'g')
	end as phone_normalized,
	merged_into_customer_id
	from customer
	where lower(trim(source_system)) = 'quickhop')
	as q
	on g.phone_normalized = q.phone_normalized
	where g.merged_into_customer_id is null
	and q.merged_into_customer_id is null
	order by
	g.email asc,
	g.customer_id asc
	limit 200;


Q13 Parcel-heavy zones for ride cross sell
select coalesce(r.zone_name_canonical, p.zone_name_canonical)
			as zone_name_canonical, 
			coalesce(r.ride_count, 0) as ride_count,
			coalesce(p.parcel_count, 0) as parcel_count,
			round(
		100.0 * coalesce(p.parcel_count, 0)
		/ nullif(coalesce(r.ride_count, 0) + coalesce(p.parcel_count, 0),
		0 ),
	2 	) as parcel_share_percent
	from (
select initcap(replace(lower(trim(z.zone_name)), '-', ' '))
as zone_name_canonical,
count(*) as ride_count
from trip as t
join zone as z
on z.zone_id = t.pickup_zone_id
and z.source_system = t.source_system
group by 1 )
as r
full outer join (
select initcap(replace(lower(trim(z.zone_name)), '-', ' '))
as zone_name_canonical,
count(*) as parcel_count
from package_delivery as p
join zone as z
on z.zone_id = p.pickup_zone_id
and z.source_system = p.source_system
group by 1 )
as p on r.zone_name_canonical = p.zone_name_canonical
where 100.0 * coalesce(p.parcel_count, 0)
/ nullif(
coalesce(r.ride_count, 0) + coalesce(p.parcel_count, 0), 0 ) > 18
order by parcel_share_percent desc, zone_name_canonical asc
limit 25;


Q14 Berlin zones with high cancellation rates
select initcap(replace(lower(trim(z.zone_name)), '-', ' '))
as zone_name_canonical,
count(*) as total_rides,
sum( case
when lower(trim(t.status)) in (
			'cancelled_by_rider',
			'cancelled_by_rider',
			'aborted'
			)
			then 1
			else 0
			end
	) as cancelled_rides,
	round(
100.0 * sum(
case
when lower(trim(t.status)) in (
			'cancelled_by_rider',
			'cancelled_by_rider',
			'aborted'
)
			then 1
			else 0
			end
) / nullif(count(*), 0),
2 )
as cancellation_rate_percent

from trip as t
join zone z
on z.zone_id = t.pickup_zone_id
and z.source_system = t.source_system

group by 1

having count(*) < 1100
and 100.0 * sum( case
when lower(trim(t.status)) in(
						'cancelled_by_rider',
			'cancelled_by_rider',
			'aborted' )
			then 1
			else 0
			end
			) / nullif(count(*), 0) > 25
		order by
		cancellation_rate_percent desc,
		zone_name_canonical asc
		limit 25;
		
Q15 Top 5 vehicles by successful-payment revenue
SELECT
    v.vehicle_id,
    v.license_plate,
    SUM(x.amount) AS total_revenue_eur

FROM (
    SELECT
        t.vehicle_id,
        t.source_system,
        p.amount
    FROM payment AS p
    JOIN trip AS t
        ON p.service_id = t.trip_id::text
    WHERE LOWER(TRIM(p.status)) = 'succeeded'
      AND CASE
            WHEN p.payment_correction_flag = TRUE THEN 'package'
            ELSE LOWER(TRIM(p.service_type))
          END = 'ride'

    UNION ALL

    SELECT
        d.vehicle_id,
        d.source_system,
        p.amount
    FROM payment AS p
    JOIN package_delivery AS d
        ON p.service_id = d.delivery_id::text
    WHERE LOWER(TRIM(p.status)) = 'succeeded'
      AND CASE
            WHEN p.payment_correction_flag = TRUE THEN 'package'
            ELSE LOWER(TRIM(p.service_type))
          END = 'package'

) AS x

JOIN vehicle AS v
    ON v.vehicle_id = x.vehicle_id
   AND v.source_system = x.source_system

GROUP BY
    v.vehicle_id,
    v.license_plate

ORDER BY
    total_revenue_eur DESC,
    v.vehicle_id ASC
LIMIT 5;


Q16 Revenue by source system, service type and customer type
SELECT
    x.source_system,
    x.service_type_corrected,
    x.customer_type,
    SUM(x.amount) AS total_revenue_eur

FROM (
    SELECT
        t.source_system,
        'ride' AS service_type_corrected,
        c.customer_type,
        p.amount
    FROM payment AS p
    JOIN trip AS t
        ON p.service_id = t.trip_id::text
    JOIN customer AS c
        ON c.customer_id = t.rider_customer_id
       AND c.source_system = t.source_system
    WHERE LOWER(TRIM(p.status)) = 'succeeded'
      AND CASE
            WHEN p.payment_correction_flag = TRUE THEN 'package'
            ELSE LOWER(TRIM(p.service_type))
          END = 'ride'

    UNION ALL

    SELECT
        d.source_system,
        'package' AS service_type_corrected,
        c.customer_type,
        p.amount
    FROM payment AS p
    JOIN package_delivery AS d
        ON p.service_id = d.delivery_id::text
    JOIN customer AS c
        ON c.customer_id = d.sender_customer_id
       AND c.source_system = d.source_system
    WHERE LOWER(TRIM(p.status)) = 'succeeded'
      AND CASE
            WHEN p.payment_correction_flag = TRUE THEN 'package'
            ELSE LOWER(TRIM(p.service_type))
          END = 'package'

) AS x

GROUP BY
    x.source_system,
    x.service_type_corrected,
    x.customer_type

ORDER BY
    total_revenue_eur DESC,
    x.source_system ASC,
    x.service_type_corrected ASC,
    x.customer_type ASC

LIMIT 25;


Q17 Payment service-type reconciliation errors
SELECT
    p.payment_id,
    p.service_type AS claimed_service_type,
    CASE
        WHEN t.trip_id IS NOT NULL THEN 'ride'
        WHEN d.delivery_id IS NOT NULL THEN 'package'
    END AS actual_service_type,
    p.service_id

FROM payment AS p

LEFT JOIN trip AS t
    ON p.service_id = t.trip_id::text

LEFT JOIN package_delivery AS d
    ON p.service_id = d.delivery_id::text

WHERE
    (
        t.trip_id IS NOT NULL
        AND LOWER(TRIM(p.service_type)) <> 'ride'
    )
    OR
    (
        d.delivery_id IS NOT NULL
        AND LOWER(TRIM(p.service_type)) <> 'package'
    )

ORDER BY
    p.payment_id ASC

LIMIT 100;


Q18 Customers inactive for at least 60 days
SELECT
    COALESCE(c.merged_into_customer_id, c.customer_id)
        AS master_customer_id,
    master.email,
    SUM(r.total_rides) AS total_completed_rides,
    MAX(r.last_ride)::date AS last_ride_date,
    (
        MAX(latest.latest_ride)::date
        - MAX(r.last_ride)::date
    ) AS days_since_last_ride
FROM
(
    SELECT
        source_system,
        rider_customer_id,
        COUNT(*) AS total_rides,
        MAX(completed_at) AS last_ride
    FROM trip
    WHERE LOWER(TRIM(status)) IN ('completed', 'finished')
    GROUP BY source_system, rider_customer_id
) AS r
JOIN customer AS c
    ON c.customer_id = r.rider_customer_id
    AND c.source_system = r.source_system
JOIN customer AS master
    ON master.customer_id =
        COALESCE(c.merged_into_customer_id, c.customer_id)
    AND master.source_system =
        CASE
            WHEN c.merged_into_customer_id IS NOT NULL THEN 'goride'
            ELSE c.source_system
        END
CROSS JOIN
(
    SELECT MAX(completed_at) AS latest_ride
    FROM trip
    WHERE LOWER(TRIM(status)) IN ('completed', 'finished')
) AS latest
WHERE LOWER(TRIM(c.customer_type)) = 'individual'
GROUP BY
    COALESCE(c.merged_into_customer_id, c.customer_id),
    master.email
HAVING
    SUM(r.total_rides) >= 3
    AND MAX(r.last_ride)::date
        <= MAX(latest.latest_ride)::date - 60
ORDER BY
    days_since_last_ride DESC,
    master_customer_id ASC
LIMIT 100;


Q19 Average monthly ride spend per rider by canonical zone
select  zone_name_canonical,
    COUNT(DISTINCT (rider_customer_id, ride_month))
        AS distinct_rider_months,
    SUM(amount) AS total_zone_spend_eur,
    SUM(amount) / COUNT(DISTINCT (rider_customer_id, ride_month))
        AS avg_spending_per_rider_per_month_eur
FROM
(
    SELECT
        INITCAP(REPLACE(LOWER(TRIM(z.zone_name)), '-', ' '))
            AS zone_name_canonical,
        t.rider_customer_id,
        DATE_TRUNC('month', t.requested_at) AS ride_month,
        p.amount
    FROM trip AS t
    JOIN zone AS z
        ON z.zone_id = t.pickup_zone_id
        AND z.source_system = t.source_system
    JOIN payment AS p
        ON p.service_id = t.trip_id::text
    WHERE
        p.status = 'succeeded'
        AND LOWER(TRIM(p.service_type)) = 'ride'
        AND COALESCE(p.payment_correction_flag, FALSE) = FALSE
) AS ride_spending
GROUP BY zone_name_canonical
ORDER BY
    avg_spending_per_rider_per_month_eur DESC,
    zone_name_canonical ASC
LIMIT 25;


Q20 Top 20 drivers by average monthly successful-payment revenue
SELECT
    master_driver_id,
    driver_name,
    COUNT(DISTINCT active_month) AS active_months,
    SUM(revenue) AS total_revenue_eur,
    SUM(revenue) / COUNT(DISTINCT active_month)
        AS avg_monthly_revenue_eur
FROM
(
    SELECT
        COALESCE(d.merged_into_driver_id, d.driver_id)
            AS master_driver_id,
        COALESCE(master.driver_name, d.driver_name)
            AS driver_name,
        DATE_TRUNC('month', activity.requested_at) AS active_month,
        activity.revenue
    FROM
    (
        SELECT
            t.driver_id,
            t.source_system,
            t.trip_id::text AS service_id,
            t.requested_at,
            COALESCE(p.amount, 0) AS revenue
        FROM trip AS t
        LEFT JOIN payment AS p
            ON p.service_id = t.trip_id::text
            AND p.status = 'succeeded'
            AND LOWER(TRIM(p.service_type)) = 'ride'
            AND COALESCE(p.payment_correction_flag, FALSE) = FALSE
        WHERE t.status IN ('completed', 'finished')

        UNION ALL

        SELECT
            pd.driver_id,
            pd.source_system,
            pd.delivery_id::text AS service_id,
            pd.requested_at,
            COALESCE(p.amount, 0) AS revenue
        FROM package_delivery AS pd
        LEFT JOIN payment AS p
            ON p.service_id = pd.delivery_id::text
            AND p.status = 'succeeded'
            AND (
                CASE
                    WHEN p.payment_correction_flag IS TRUE
                        THEN 'package'
                    ELSE LOWER(TRIM(p.service_type))
                END
            ) = 'package'
        WHERE LOWER(TRIM(pd.status)) IN ('delivered', 'completed')
    ) AS activity
    JOIN driver AS d
        ON d.driver_id = activity.driver_id
        AND d.source_system = activity.source_system
    LEFT JOIN driver AS master
        ON master.driver_id = d.merged_into_driver_id
) AS driver_activity
GROUP BY master_driver_id, driver_name
ORDER BY
    avg_monthly_revenue_eur DESC,
    master_driver_id ASC
LIMIT 20;

SELECT
    COUNT(*) AS activities_without_successful_payment
FROM
(
    SELECT
        t.trip_id::text AS service_id
    FROM trip AS t
    WHERE t.status IN ('completed', 'finished')
      AND NOT EXISTS (
          SELECT 1
          FROM payment AS p
          WHERE p.service_id = t.trip_id::text
            AND p.status = 'succeeded'
            AND LOWER(TRIM(p.service_type)) = 'ride'
            AND COALESCE(p.payment_correction_flag, FALSE) = FALSE
      )

    UNION ALL

    SELECT
        pd.delivery_id::text AS service_id
    FROM package_delivery AS pd
    WHERE LOWER(TRIM(pd.status)) IN ('delivered', 'completed')
      AND NOT EXISTS (
          SELECT 1
          FROM payment AS p
          WHERE p.service_id = pd.delivery_id::text
            AND p.status = 'succeeded'
            AND CASE
                WHEN p.payment_correction_flag IS TRUE THEN 'package'
                ELSE LOWER(TRIM(p.service_type))
            END = 'package'
      )
) AS unpaid_activities;


Q21 Collected, refunded, and net revenue by source and service type
select    source_system,
    service_type_corrected,
    SUM(
        CASE WHEN status = 'succeeded' THEN amount ELSE 0 END
    ) AS collected_revenue_eur,
    SUM(
        CASE WHEN status = 'refunded' THEN amount ELSE 0 END
    ) AS refunded_revenue_eur,
    SUM(
        CASE WHEN status = 'succeeded' THEN amount ELSE 0 END
    ) -
    SUM(
        CASE WHEN status = 'refunded' THEN amount ELSE 0 END
    ) AS net_revenue_eur
FROM
(
    SELECT
        CASE
            WHEN p.payment_correction_flag IS TRUE
                THEN 'package'
            ELSE LOWER(TRIM(p.service_type))
        END AS service_type_corrected,
        p.status,
        p.amount,
        CASE
            WHEN p.service_type = 'ride' OR p.payment_correction_flag IS TRUE
                THEN COALESCE(t.source_system, pd.source_system)
            WHEN p.service_type = 'package'
                THEN pd.source_system
        END AS source_system
    FROM payment AS p
    LEFT JOIN trip AS t
        ON p.service_id = t.trip_id::text
    LEFT JOIN package_delivery AS pd
        ON p.service_id = pd.delivery_id::text
) AS corrected_payments
WHERE status IN ('succeeded', 'refunded')
  AND source_system IS NOT NULL
GROUP BY source_system, service_type_corrected
ORDER BY
    net_revenue_eur DESC,
    source_system ASC,
    service_type_corrected ASC
LIMIT 25;



Q22 Top 20 business customers by average monthly parcel spend
SELECT
    customer_id,
    business_name,
    COUNT(DISTINCT delivery_month) AS active_months,
    SUM(revenue) AS total_spend_eur,
    SUM(revenue) / COUNT(DISTINCT delivery_month)
        AS avg_monthly_spend_eur
FROM
(
    SELECT
        c.customer_id,
        c.business_name,
        DATE_TRUNC('month', pd.requested_at) AS delivery_month,
        p.amount AS revenue
    FROM customer AS c
    JOIN package_delivery AS pd
        ON pd.sender_customer_id = c.customer_id
        AND pd.source_system = c.source_system
    JOIN payment AS p
        ON p.service_id = pd.delivery_id::text
    WHERE
        c.customer_type = 'business'
        AND p.status = 'succeeded'
        AND (
            CASE
                WHEN p.payment_correction_flag IS TRUE
                    THEN 'package'
                ELSE LOWER(TRIM(p.service_type))
            END
        ) = 'package'
) AS business_spending
GROUP BY customer_id, business_name
ORDER BY
    avg_monthly_spend_eur DESC,
    customer_id ASC
LIMIT 20;


Q23 Cancelled trips with successful payments and no refund
SELECT
    t.trip_id,
    t.source_system,
    t.status AS trip_status,
    p.payment_id,
    p.amount AS payment_amount_eur
FROM trip AS t
JOIN payment AS p
    ON p.service_id = t.trip_id::text
WHERE
    LOWER(TRIM(t.status)) IN (
        'cancelled_by_rider',
        'cancelled_by_driver',
        'aborted',
        'no_show',
        'noshow'
    )
    AND p.status = 'succeeded'
    AND NOT EXISTS (
        SELECT 1
        FROM payment AS refund
        WHERE refund.service_id = t.trip_id::text
          AND refund.status = 'refunded'
    )
ORDER BY
    payment_amount_eur DESC,
    t.trip_id ASC
LIMIT 50;


Q24 Ghost trips with no valid driver-vehicle assignment
SELECT
    t.trip_id,
    t.source_system,
    t.driver_id,
    t.vehicle_id,
    t.requested_at::date AS trip_date
FROM trip AS t
WHERE
    LOWER(TRIM(t.status)) IN ('completed', 'finished')
    AND NOT EXISTS (
        SELECT 1
        FROM driver_vehicle_assignment AS dva
        WHERE dva.driver_id = t.driver_id
          AND dva.vehicle_id = t.vehicle_id
          AND dva.valid_from <= t.requested_at::date
          AND (
              dva.valid_to IS NULL
              OR dva.valid_to >= t.requested_at::date
          )
    )
ORDER BY
    trip_date DESC,
    t.trip_id ASC
LIMIT 50;


Q25 Average monthly successful-payment ride revenue per driver by zone
SELECT
    zone_name_canonical,
    COUNT(DISTINCT (master_driver_id, ride_month))
        AS qualifying_driver_months,
    SUM(revenue) AS total_zone_revenue_eur,
    SUM(revenue) /
        COUNT(DISTINCT (master_driver_id, ride_month))
        AS avg_revenue_per_driver_per_month_eur
FROM
(
    SELECT
        INITCAP(REPLACE(LOWER(TRIM(z.zone_name)), '-', ' '))
            AS zone_name_canonical,
        COALESCE(d.merged_into_driver_id, d.driver_id)
            AS master_driver_id,
        DATE_TRUNC('month', t.requested_at) AS ride_month,
        p.amount AS revenue
    FROM trip AS t
    JOIN zone AS z
        ON z.zone_id = t.pickup_zone_id
        AND z.source_system = t.source_system
    JOIN driver AS d
        ON d.driver_id = t.driver_id
        AND d.source_system = t.source_system
    JOIN payment AS p
        ON p.service_id = t.trip_id::text
    WHERE
        p.status = 'succeeded'
        AND LOWER(TRIM(p.service_type)) = 'ride'
        AND COALESCE(p.payment_correction_flag, FALSE) = FALSE
) AS driver_zone_revenue
GROUP BY zone_name_canonical
ORDER BY
    avg_revenue_per_driver_per_month_eur DESC,
    zone_name_canonical ASC
LIMIT 25;
