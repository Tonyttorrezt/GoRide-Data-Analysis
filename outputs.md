# GoRide SQL Query Outputs

## Q01
873


## Q02
784755.77


## Q03
784755.77


## Q04
| customer_type | count |
|---|---:|
| individual | 3180 |
| business | 70 |


## Q05
2856


## Q06

| table_name | column_name |
|---|---|
| payment | payment_id |
| payment | service_type |
| payment | service_id |
| payment | amount |
| payment | status |
| payment | payment_method |
| payment | payment_correction_flag |
| payment | attempted_at |
| trip | trip_id |
| trip | source_system |
| trip | source_original_id |
| trip | rider_customer_id |
| trip | driver_id |
| trip | vehicle_id |
| trip | pickup_zone_id |
| trip | dropoff_zone_id |
| trip | status |
| trip | requested_at |
| trip | completed_at |
| trip | payment_method |
| trip | fare_amount |



## Q07
| source_system | average_fare |
|---|---:|
| goride | 34.63 |
| quickhop | 34.47 |



## Q08

| service_type | total_records | successful_records | success_rate |
|---|---:|---:|---:|
| package | 3498 | 3310 | 94.63 |
| ride | 23327 | 21693 | 93.00 |

## Q09
| status | trip_count |
|---|---:|
| cancelled_by_driver | 2360 |
| cancelled_by_rider | 2746 |
| completed | 21655 |
| no_show | 2848 |

## Q10
| zone_name | trip_count | average_fare |
|---|---:|---:|
| Charlottenburg | 1645 | 35.36 |
| Friedrichshain | 1588 | 34.08 |
| Kreuzberg | 1508 | 34.13 |
| Lichtenberg | 812 | 35.04 |
| Marzahn | 793 | 34.57 |
| Mitte | 1590 | 34.59 |
| Moabit | 1532 | 34.42 |
| Neukolln | 1586 | 34.22 |
| Pankow | 756 | 35.16 |
| Prenzlauer Berg | 1498 | 35.34 |


## Q11
| driver_id | driver_name | average_rating | rated_ride_count |
|---:|---|---:|---:|
| 14 | Nora Braun | 4.37 | 35 |
| 364 | Sophie Klein | 4.37 | 35 |
| 392 | Sven Krause | 4.35 | 33 |
| 48 | Liam Mueller | 4.34 | 31 |
| 43 | Lara Meyer | 4.32 | 30 |
| 447 | Lena Lange | 4.31 | 32 |
| 189 | Nora Richter | 4.28 | 36 |
| 82 | Lukas Schwarz | 4.27 | 35 |
| 428 | Sophie Lange | 4.27 | 32 |
| 429 | Tom Schaefer | 4.27 | 32 |
| 908 | Finn Wolf | 4.27 | 35 |
| 137 | Finn Schaefer | 4.26 | 37 |
| 381 | Erik Schneider | 4.26 | 34 |
| 425 | Max Schwarz | 4.26 | 33 |
| 18 | Lea Schulz | 4.25 | 32 |
| 276 | Lara Bauer | 4.25 | 30 |
| 169 | Felix Schulz | 4.24 | 36 |
| 214 | Mia Becker | 4.24 | 34 |
| 420 | Lena Meyer | 4.24 | 39 |
| 903 | Jan Schmidt | 4.24 | 31 |


## Q12

| goride_customer_id | quickhop_customer_id | phone_normalized | email |
|---:|---:|---|---|
| 3007 | 3007 | 491647324623 | anna.bauerdup3@example.com |
| 3179 | 3179 | 491703046517 | anna.muellerdup89@mail.com |
| 3177 | 3177 | 491572749021 | ben.beckerdup88@example.com |
| 3119 | 3119 | 491597323816 | ben.kochdup59@mail.de |
| 3059 | 3059 | 491746698706 | emma.schmidtdup29@mail.de |
| 3065 | 3065 | 491786217575 | emma.schulzdup32@gmx.de |
| 3101 | 3101 | 491751489418 | emma.wagnerdup50@mail.de |
| 3075 | 3075 | 491732840565 | erik.weberdup37@mail.com |
| 3173 | 3173 | 491762951927 | eva.meyerdup86@example.com |
| 3089 | 3089 | 491587641644 | eva.schmidtdup44@example.com |
| 3159 | 3159 | 491606139691 | finn.muellerdup79@mail.com |
| 3049 | 3049 | 491669201256 | finn.schroederdup24@mail.de |
| 3175 | 3175 | 491721936781 | hannah.hoffmanndup87@web.de |
| 3009 | 3009 | 491556837445 | hannah.muellerdup4@web.de |
| 3137 | 3137 | 491783247776 | hannah.wernerdup68@web.de |
| 3163 | 3163 | 491687396931 | hannah.wernerdup81@gmx.de |
| 3019 | 3019 | 491501536003 | jan.fischerdup9@mail.de |
| 3165 | 3165 | 491535018631 | jan.kleindup82@web.de |
| 3153 | 3153 | 491629435412 | jan.schulzdup76@example.com |
| 3167 | 3167 | 491577173054 | jan.schulzdup83@web.de |
| 3015 | 3015 | 491704133483 | jonas.schwarzdup7@mail.de |
| 3047 | 3047 | 491703867507 | klara.meyerdup23@mail.de |
| 3039 | 3039 | 491616934489 | klara.weberdup19@example.com |
| 3001 | 3001 | 491659404610 | lara.hofmanndup0@web.de |
| 3087 | 3087 | 491662569291 | lara.langedup43@web.de |
| 3105 | 3105 | 491542361636 | lea.bauerdup52@web.de |
| 3027 | 3027 | 491753283061 | lea.kleindup13@web.de |
| 3099 | 3099 | 491513669613 | lea.krausedup49@mail.com |
| 3109 | 3109 | 491768007575 | lea.neumanndup54@gmx.de |
| 3063 | 3063 | 491669046216 | lea.zimmermanndup31@web.de |
| 3097 | 3097 | 491712241975 | leon.schneiderdup48@example.com |
| 3145 | 3145 | 491615480794 | liam.bauerdup72@mail.de |
| 3011 | 3011 | 491605279932 | liam.wagnerdup5@example.com |
| 3131 | 3131 | 491537837787 | liam.zimmermanndup65@mail.com |
| 3055 | 3055 | 491786250385 | maria.hartmanndup27@mail.com |
| 3155 | 3155 | 491785703613 | maria.richterdup77@web.de |
| 3073 | 3073 | 491655676835 | maria.schulzdup36@gmx.de |
| 3171 | 3171 | 491684278491 | marie.braundup85@mail.com |
| 3003 | 3003 | 491714252186 | max.weberdup1@web.de |
| 3079 | 3079 | 491541605920 | max.weberdup39@mail.de |
| 3057 | 3057 | 491552580352 | mia.hofmanndup28@example.com |
| 3147 | 3147 | 491795505739 | mia.langedup73@example.com |
| 3139 | 3139 | 491711966421 | mia.meyerdup69@gmx.de |
| 3061 | 3061 | 491774622993 | noah.langedup30@mail.com |
| 3123 | 3123 | 491593463869 | nora.fischerdup61@mail.de |
| 3103 | 3103 | 491765628929 | nora.hartmanndup51@mail.com |
| 3161 | 3161 | 491747695802 | nora.schaeferdup80@web.de |
| 3017 | 3017 | 491574713173 | olivia.hofmanndup8@web.de |
| 3033 | 3033 | 491523868768 | olivia.krausedup16@web.de |
| 3035 | 3035 | 491593809967 | olivia.langedup17@example.com |
| 3113 | 3113 | 491617067824 | olivia.schroederdup56@example.com |
| 3051 | 3051 | 491632785364 | paul.schwarzdup25@mail.de |
| 3077 | 3077 | 491724293083 | paul.schwarzdup38@mail.com |
| 3151 | 3151 | 491637219629 | sophie.kochdup75@web.de |
| 3121 | 3121 | 491623259717 | sophie.weberdup60@web.de |
| 3085 | 3085 | 491724254164 | sven.beckerdup42@gmx.de |
| 3107 | 3107 | 491509406848 | sven.richterdup53@example.com |
| 3149 | 3149 | 491685500507 | theo.kleindup74@example.com |
| 3125 | 3125 | 491796763353 | theo.richterdup62@web.de |
| 3005 | 3005 | 491727290929 | tom.hoffmanndup2@mail.com |


## Q13

| zone_name | total_trips | cancelled_trips | cancellation_rate |
|---|---:|---:|---:|
| Schoneberg | 1059 | 297 | 21.90 |
| Treptow | 1057 | 287 | 21.35 |
| Lichtenberg | 1128 | 300 | 21.01 |
| Pankow | 1025 | 266 | 20.60 |
| Steglitz | 1097 | 282 | 20.45 |
| Reinickendorf | 1039 | 267 | 20.44 |
| Marzahn | 1068 | 265 | 19.88 |
| Spandau | 1029 | 255 | 19.86 |


## Q14

No rows returned.

## Q15

| vehicle_id | license_plate | total_revenue |
|---:|---|---:|
| 129 | B-XK 9984 | 5755.72 |
| 517 | B-YF 2124 | 4630.18 |
| 52 | B-SW 5234 | 4562.17 |
| 330 | B-RH 1129 | 4560.21 |
| 196 | B-SF 1175 | 4468.60 |


## Q16

| source_system | service_type | customer_type | total_revenue |
|---|---|---|---:|
| goride | ride | individual | 486238.06 |
| quickhop | ride | individual | 263744.22 |
| goride | package | individual | 18120.69 |
| goride | package | business | 16652.80 |


## Q17

| service_id | ride_service_type | package_service_type | payment_id |
|---:|---|---|---:|
| 23550 | ride | package | 339 |
| 23594 | ride | package | 402 |
| 23819 | ride | package | 715 |
| 24310 | ride | package | 1408 |
| 24323 | ride | package | 1429 |
| 24332 | ride | package | 1443 |
| 24432 | ride | package | 1578 |
| 24599 | ride | package | 1793 |
| 24723 | ride | package | 1990 |
| 25008 | ride | package | 2376 |
| 25009 | ride | package | 2376 |
| 25668 | ride | package | 3344 |
| 25681 | ride | package | 3363 |
| 25831 | ride | package | 3568 |
| 25919 | ride | package | 3694 |
| 26465 | ride | package | 4481 |
| 26473 | ride | package | 4496 |
| 26807 | ride | package | 4969 |


## Q18

| customer_id | email | trip_count | first_trip_date | days_since_first_trip |
|---:|---|---:|---|---:|
| 2992 | emma.zimmermann2992@mail.de | 5 | 2024-08-06 | 632 |
| 2242 | lina.becker2242@mail.de | 3 | 2024-08-21 | 617 |
| 1837 | tom.wagner1837@example.com | 3 | 2024-09-01 | 606 |
| 1891 | noah.schwarz1891@mail.de | 3 | 2024-09-09 | 598 |
| 2392 | theo.mueller2392@web.de | 4 | 2024-09-24 | 583 |
| 2451 | jonas.lange2451@gmx.de | 3 | 2024-09-24 | 583 |
| 2948 | theo.hoffmann2948@gmx.de | 4 | 2024-10-07 | 570 |
| 2368 | theo.becker2368@mail.com | 3 | 2024-10-10 | 567 |
| 2903 | hannah.fischer2903@mail.com | 3 | 2024-10-10 | 567 |
| 2580 | lara.wolf2580@gmx.de | 3 | 2024-10-11 | 566 |
| 1747 | leon.wolf1747@example.com | 3 | 2024-10-13 | 564 |
| 3174 | eva.meyerdup86@example.com | 3 | 2024-10-25 | 552 |
| 2616 | jan.hofmann2616@example.com | 5 | 2024-10-28 | 549 |
| 1726 | klara.schaefer1726@example.com | 5 | 2024-11-02 | 544 |
| 2245 | ben.wagner2245@gmx.de | 3 | 2024-11-03 | 543 |
| 2436 | lara.schwarz2436@mail.com | 4 | 2024-11-04 | 542 |
| 2878 | erik.bauer2878@web.de | 3 | 2024-11-04 | 542 |
| 2337 | marie.werner2337@mail.de | 5 | 2024-11-07 | 539 |
| 2821 | theo.hoffmann2821@gmx.de | 3 | 2024-11-07 | 539 |
| 2420 | sven.hofmann2420@mail.com | 3 | 2024-11-08 | 538 |
| 2621 | noah.werner2621@web.de | 6 | 2024-11-09 | 537 |
| 2885 | nora.fischer2885@web.de | 6 | 2024-11-13 | 533 |
| 1933 | noah.weber1933@gmx.de | 4 | 2024-11-14 | 532 |
| 2610 | eva.schmitt2610@gmx.de | 4 | 2024-11-17 | 529 |
| 2894 | tom.richter2894@mail.de | 6 | 2024-11-18 | 528 |
| 3148 | mia.langedup73@example.com | 6 | 2024-11-19 | 527 |
| 2171 | maria.meyer2171@gmx.de | 4 | 2024-11-21 | 525 |
| 1704 | jan.krueger1704@mail.com | 6 | 2024-11-23 | 523 |
| 2866 | jonas.schulz2866@gmx.de | 3 | 2024-11-26 | 520 |
| 2476 | ben.mueller2476@web.de | 4 | 2024-11-27 | 519 |
| 2316 | erik.koch2316@mail.de | 4 | 2024-11-28 | 518 |
| 2816 | lina.braun2816@web.de | 3 | 2024-11-28 | 518 |
| 2146 | theo.schmidt2146@mail.com | 4 | 2024-11-29 | 517 |
| 2054 | emma.werner2054@mail.com | 4 | 2024-11-30 | 516 |
| 2423 | lena.bauer2423@web.de | 7 | 2024-11-30 | 516 |
| 2072 | noah.zimmermann2072@example.com | 6 | 2024-12-02 | 514 |
| 1858 | nora.koch1858@mail.com | 6 | 2024-12-03 | 513 |
| 2371 | marie.krause2371@mail.de | 3 | 2024-12-03 | 513 |
| 1977 | leon.lange1977@example.com | 3 | 2024-12-04 | 512 |
| 2926 | finn.weber2926@gmx.de | 4 | 2024-12-04 | 512 |
| 2547 | lukas.zimmermann2547@mail.com | 4 | 2024-12-06 | 510 |
| 1880 | theo.becker1880@mail.de | 5 | 2024-12-08 | 508 |
| 2411 | marie.krause2411@mail.com | 5 | 2024-12-08 | 508 |
| 2413 | sven.koch2413@mail.com | 3 | 2024-12-08 | 508 |
| 2861 | leon.werner2861@mail.com | 5 | 2024-12-09 | 507 |
| 2934 | finn.neumann2934@gmx.de | 6 | 2024-12-09 | 507 |
| 2274 | jonas.hofmann2274@mail.com | 3 | 2024-12-11 | 505 |
| 2121 | felix.schulz2121@example.com | 3 | 2024-12-13 | 503 |
| 2988 | felix.krueger2988@mail.de | 4 | 2024-12-14 | 502 |
| 3000 | lea.hofmann3000@gmx.de | 4 | 2024-12-14 | 502 |
| 2433 | anna.zimmermann2433@example.com | 3 | 2024-12-17 | 499 |
| 1769 | lukas.neumann1769@gmx.de | 3 | 2024-12-18 | 498 |
| 2097 | eva.krueger2097@mail.de | 5 | 2024-12-18 | 498 |
| 3060 | emma.schmidtdup29@mail.de | 4 | 2024-12-18 | 498 |
| 1768 | lena.schmitt1768@mail.de | 3 | 2024-12-19 | 497 |
| 2644 | lina.klein2644@web.de | 3 | 2024-12-20 | 496 |
| 2752 | jan.neumann2752@web.de | 5 | 2024-12-20 | 496 |
| 1981 | lea.hartmann1981@mail.de | 5 | 2024-12-21 | 495 |
| 1874 | theo.schroeder1874@example.com | 6 | 2024-12-25 | 491 |
| 2907 | erik.schwarz2907@web.de | 5 | 2024-12-25 | 491 |
| 1894 | emma.braun1894@example.com | 5 | 2024-12-26 | 490 |
| 2455 | emma.schmitt2455@mail.de | 7 | 2024-12-26 | 490 |
| 3104 | nora.hartmanndup51@mail.com | 3 | 2024-12-26 | 490 |
| 2229 | hannah.mueller2229@example.com | 3 | 2024-12-27 | 489 |
| 2721 | klara.wagner2721@mail.com | 6 | 2024-12-27 | 489 |
| 2498 | marie.schneider2498@gmx.de | 6 | 2024-12-28 | 488 |
| 2307 | mia.meyer2307@example.com | 5 | 2024-12-29 | 487 |
| 3020 | jan.fischerdup9@mail.de | 3 | 2024-12-29 | 487 |
| 2043 | jonas.weber2043@example.com | 6 | 2024-12-30 | 486 |
| 2672 | lena.fischer2672@mail.de | 4 | 2024-12-30 | 486 |
| 2916 | tom.schneider2916@mail.com | 6 | 2024-12-30 | 486 |
| 2656 | jonas.schmidt2656@gmx.de | 3 | 2024-12-31 | 485 |
| 2714 | emma.fischer2714@example.com | 7 | 2024-12-31 | 485 |
| 1756 | sven.bauer1756@example.com | 5 | 2025-01-01 | 484 |
| 2059 | lina.neumann2059@web.de | 4 | 2025-01-01 | 484 |
| 2511 | finn.meyer2511@example.com | 3 | 2025-01-01 | 484 |
| 2925 | theo.hofmann2925@gmx.de | 3 | 2025-01-01 | 484 |
| 2996 | olivia.schaefer2996@gmx.de | 5 | 2025-01-01 | 484 |
| 3126 | theo.richterdup62@web.de | 3 | 2025-01-01 | 484 |
| 2215 | jan.werner2215@web.de | 3 | 2025-01-02 | 483 |
| 2326 | nora.zimmermann2326@mail.de | 5 | 2025-01-02 | 483 |
| 2402 | jonas.mueller2402@web.de | 5 | 2025-01-02 | 483 |
| 1967 | leon.schulz1967@gmx.de | 4 | 2025-01-03 | 482 |
| 2401 | olivia.braun2401@example.com | 4 | 2025-01-03 | 482 |
| 2060 | lena.krause2060@mail.de | 5 | 2025-01-05 | 480 |
| 2710 | theo.schroeder2710@web.de | 4 | 2025-01-06 | 479 |
| 1766 | sophie.koch1766@mail.com | 6 | 2025-01-07 | 478 |
| 2275 | leon.krause2275@mail.de | 5 | 2025-01-07 | 478 |
| 2735 | klara.krause2735@mail.com | 6 | 2025-01-07 | 478 |
| 2018 | lea.hoffmann2018@mail.com | 6 | 2025-01-08 | 477 |
| 2415 | nora.hofmann2415@mail.de | 4 | 2025-01-08 | 477 |
| 2006 | emma.krause2006@mail.com | 5 | 2025-01-09 | 476 |
| 2292 | lea.wagner2292@gmx.de | 4 | 2025-01-09 | 476 |
| 2400 | lea.zimmermann2400@web.de | 6 | 2025-01-09 | 476 |
| 2773 | lea.koch2773@mail.com | 5 | 2025-01-09 | 476 |
| 2458 | jan.krueger2458@web.de | 3 | 2025-01-10 | 475 |
| 2481 | klara.schwarz2481@gmx.de | 5 | 2025-01-10 | 475 |
| 2552 | lara.schmidt2552@mail.de | 4 | 2025-01-10 | 475 |
| 3006 | tom.hoffmanndup2@mail.com | 4 | 2025-01-10 | 475 |
| 2212 | ben.fischer2212@web.de | 5 | 2025-01-11 | 474 |


## Q19

| zone_name | trip_count | total_revenue | average_fare |
|---|---:|---:|---:|
| Schoneberg | 758 | 28010.15 | 36.9527044854881266 |
| Lichtenberg | 772 | 28457.79 | 36.8624222797927461 |
| Charlottenburg | 1591 | 58164.11 | 36.5582086737900691 |
| Prenzlauer Berg | 1453 | 52937.21 | 36.4330419821059876 |
| Wedding | 1505 | 54681.57 | 36.3332691029900332 |
| Pankow | 737 | 26589.26 | 36.0776933514246947 |
| Spandau | 684 | 24668.14 | 36.0645321637426901 |
| Mitte | 1534 | 55001.80 | 35.8551499348109518 |
| Steglitz | 727 | 26019.65 | 35.7904401650618982 |
| Tempelhof | 1496 | 53370.81 | 35.6756751336898396 |
| Treptow | 747 | 26610.97 | 35.6237884872824632 |
| Moabit | 1484 | 52756.18 | 35.5499865229110512 |
| Marzahn | 772 | 27420.54 | 35.5188341968911917 |
| Neukolln | 1536 | 54276.72 | 35.3364062500000000 |
| Friedrichshain | 1536 | 54129.22 | 35.2403776041666667 |
| Reinickendorf | 742 | 26044.76 | 35.1007547169811321 |
| Kreuzberg | 1470 | 51470.67 | 35.0140612244897959 |
| Wilmersdorf | 1420 | 49372.73 | 34.7695281690140845 |


## Q20

0

## Q21

| source_system | service_type | gross_revenue | refunded_amount | net_revenue |
|---|---|---:|---:|---:|
| goride | ride | 486238.06 | 14166.47 | 472071.59 |
| quickhop | ride | 263744.22 | 7180.75 | 256563.47 |
| goride | package | 34773.49 | 657.37 | 34116.12 |


## Q22
| business_id | business_name | transaction_count | total_revenue | average_revenue |
|---:|---|---:|---:|---:|
| 3218 | Kiez Blumen | 1 | 358.92 | 358.92 |
| 3230 | Friedrich Sushi | 1 | 296.56 | 296.56 |
| 3185 | Mitte Pizza | 1 | 289.31 | 289.31 |
| 3236 | Schoneberg Burger | 1 | 286.11 | 286.11 |
| 3247 | Kreuzberg Burger | 1 | 278.79 | 278.79 |
| 3214 | Berliner Kaffee | 1 | 213.76 | 213.76 |
| 3209 | Friedrich Blumen | 2 | 334.29 | 167.145 |
| 3210 | Berliner Eis | 2 | 236.44 | 118.22 |
| 3186 | Berliner Pizza | 2 | 232.42 | 116.21 |
| 3219 | Kiez Eis | 3 | 312.92 | 104.3067 |
| 3227 | Mitte Kaffee | 2 | 199.54 | 99.77 |
| 3193 | Schoneberg Bistro | 3 | 278.73 | 92.91 |
| 3243 | Kreuzberg Pizza | 2 | 184.92 | 92.46 |
| 3213 | Schoneberg Eis | 3 | 258.29 | 86.0967 |
| 3233 | Mitte Bistro | 4 | 336.08 | 84.02 |
| 3234 | Schoneberg Italiano | 3 | 246.54 | 82.18 |
| 3200 | Kreuzberg Sushi | 2 | 155.85 | 77.925 |
| 3196 | Mitte Burger | 3 | 231.15 | 77.05 |
| 3229 | Friedrich Doner | 4 | 283.34 | 70.835 |
| 3248 | Friedrich Italiano | 5 | 352.36 | 70.472 |


## Q23
| trip_id | source_system | trip_status | driver_id | average_rating |
|---|---|---|---:|---:|
| 75ad42e1-1f1c-f76e-8eb5-85d7659d63e0 | quickhop | no_show | 15084 | 4.89 |
| 79750135-ca7f-124f-bf1f-bf320b65891c | goride | cancelled_by_driver | 13173 | 4.86 |
| 125d045c-c680-19fc-9534-3667719dc733 | quickhop | aborted | 8566 | 4.75 |
| 18a7099a-b7ce-3179-9c33-74618af3e84e | goride | cancelled_by_driver | 1082 | 4.65 |
| c1a0b38b-4284-5b14-6ced-775565eae656 | goride | cancelled_by_rider | 11209 | 4.62 |
| c4bdc7bb-79bf-ca79-c270-7c56a4021d3b | quickhop | aborted | 7324 | 4.30 |
| d4396b25-229f-18d7-0ddc-97dde2dc9199 | goride | no_show | 8111 | 4.10 |
| cb76e3b1-b6b2-6a90-7fa0-2b11a9405b73 | goride | cancelled_by_rider | 4473 | 4.06 |
| 9011ff5c-d837-648d-5bdc-88f331a18fcf | goride | cancelled_by_driver | 21017 | 4.01 |
| ac6b4fc3-8da2-8209-449b-00d47c685a59 | goride | cancelled_by_rider | 4954 | 4.00 |
| 0cf33334-edbe-974f-0106-0e3d63c37a2c | goride | cancelled_by_driver | 20174 | 3.88 |
| 5f0fb714-d814-b540-9ada-e23d1ea2281b | quickhop | no_show | 9855 | 3.74 |
| a08fae51-5f73-9083-4ad3-77d8e76adac1 | goride | cancelled_by_driver | 2457 | 3.51 |
| 63cce950-9694-613f-e798-b5135eff2188 | goride | cancelled_by_driver | 17269 | 3.46 |
| e34d6f33-6528-aef6-1718-13decd165bcf | goride | cancelled_by_driver | 16524 | 3.16 |
| 04e006ad-f5ea-58c7-72ca-5d5b6768f07e | goride | cancelled_by_driver | 16075 | 2.93 |
| 9d1051a5-f283-128c-9777-c42a8c624e14 | goride | no_show | 23129 | 2.92 |
| 32368b21-b30f-ffad-43bf-1ad0f3f39f12 | goride | cancelled_by_driver | 9787 | 2.76 |
| 34c2a2ca-6bf8-928b-47f0-f4241f22aac6 | quickhop | cancelled_by_driver | 22487 | 2.55 |
| 3a33ce0e-2967-b1d2-d990-5d03f55b632d | goride | cancelled_by_driver | 4354 | 2.12 |
| e78a824c-ad66-c475-8b0a-dedfb79ede43 | goride | no_show | 3876 | 2.09 |
| f1b1517f-f3cc-3b30-88da-f5f49d51f2f7 | goride | cancelled_by_driver | 11142 | 2.02 |
| 332346d7-07fa-f982-1fb4-788bd0f9a797 | goride | cancelled_by_driver | 5784 | 2.01 |
| eac05977-4ea4-8651-9fc7-69eb5af2c114 | goride | cancelled_by_rider | 12670 | 1.94 |
| 04d561bb-beb5-4ec6-5e11-acbe856cc7b5 | goride | cancelled_by_rider | 2957 | 1.85 |
| 93ba6265-4b73-5ec2-84cb-7794ccfc632a | goride | no_show | 9825 | 1.73 |
| 42f26fdf-1933-ebf1-1be4-327f57e99493 | goride | cancelled_by_driver | 13943 | 1.59 |
| 19bf2368-ec7c-9d1f-f92c-c84fd95002f4 | goride | no_show | 3020 | 1.56 |
| c04683e4-08a8-9326-882e-eb3254bd6a00 | goride | cancelled_by_driver | 22773 | 1.32 |
| 451d1fb1-1c45-3a0b-8da9-df3833795f1c | goride | cancelled_by_rider | 5316 | 1.06 |
| dca6e424-0018-d327-4e25-49b73f4471c7 | goride | cancelled_by_rider | 2113 | 1.06 |
| 1bc4bc1d-ba41-dae6-d993-64400e4192ee | goride | cancelled_by_rider | 14860 | 0.74 |
| a61e097c-0c8c-170c-b8c1-daa993fac50c | goride | no_show | 9476 | 0.66 |
| 44270572-b4c2-d392-bbe3-a2f66f12546d | goride | cancelled_by_rider | 11 | 0.32 |
| aeffd708-3b81-74e4-9e6f-c7e9fdb56b25 | goride | cancelled_by_driver | 20211 | 0.21 |
| 4b040302-4819-3735-8099-b568f529e53e | goride | cancelled_by_rider | 22395 | 0.15 |
| c8b38134-02ed-91ce-d309-f41905fc2f77 | goride | cancelled_by_driver | 19408 | 0.13 |
| b922990d-5746-ea08-377f-078555e2d083 | quickhop | cancelled_by_rider | 10500 | 0.03 |


## Q24
| trip_id | source_system | pickup_zone_id | dropoff_zone_id | trip_date |
|---|---|---:|---:|---|
| 05043e9e-032f-9dcf-11bc-9ce335a7519c | goride | 67 | 311 | 2026-04-29 |
| 08395c52-bf39-95dd-4aea-950c1fb53a6a | goride | 50 | 49 | 2026-04-29 |
| 1e2f295f-cf2b-10af-803d-3125844bd600 | goride | 411 | 476 | 2026-04-29 |
| 34b3786c-aea3-16d9-3f06-0c7314b8aacd | goride | 466 | 253 | 2026-04-29 |
| 459b3fa5-b73c-dcb4-3f36-76d6d08a4229 | goride | 375 | 359 | 2026-04-29 |
| 45d1c194-d2f8-40e6-a625-377f07069221 | goride | 497 | 134 | 2026-04-29 |
| 61f1877d-4c65-0126-83ce-6e7eda17a8c8 | goride | 326 | 556 | 2026-04-29 |
| 63145f2c-a2f5-bae3-4631-b5958cdb5e10 | goride | 6 | 478 | 2026-04-29 |
| 7d34ce9c-6741-825f-1dba-a91fb6a8fa1a | goride | 306 | 283 | 2026-04-29 |
| 7ea5451b-9ad8-b9a2-c7f6-39f0ba0814bb | goride | 466 | 116 | 2026-04-29 |
| 81dff5d2-c98e-5741-7a95-cac9a304f209 | goride | 129 | 91 | 2026-04-29 |
| 8c046a0b-aadb-b5a3-bd90-2961ebefa05e | goride | 36 | 185 | 2026-04-29 |
| a5d96ff6-e058-6be7-9600-979e4d289dec | goride | 396 | 576 | 2026-04-29 |
| e0f60965-71f2-73fc-c87c-b8fb9325cce7 | goride | 217 | 312 | 2026-04-29 |
| e36dbe48-3713-bd89-1336-cfc350970531 | goride | 457 | 243 | 2026-04-29 |
| 0666a5d8-435f-ac18-a651-955045afaeef | goride | 388 | 194 | 2026-04-28 |
| 09ea7736-4272-b21f-c00e-b75fe8984ee1 | goride | 330 | 453 | 2026-04-28 |
| 32dccf19-18cd-e8aa-6061-5253a88e6363 | goride | 137 | 262 | 2026-04-28 |
| 38227e0f-0dab-7acc-f06c-4d6109d8e825 | goride | 475 | 397 | 2026-04-28 |
| 3c3b0a31-72d2-630e-766a-db60455e4123 | goride | 62 | 261 | 2026-04-28 |
| 436a6a51-61c6-6c7c-23c5-1d28184ed2a2 | goride | 422 | 255 | 2026-04-28 |
| 5d202b23-4bf6-5add-7375-95474fa9a898 | goride | 339 | 87 | 2026-04-28 |
| 77dfbfb1-f207-c2fa-a1e3-9da5a7122a6b | goride | 184 | 149 | 2026-04-28 |
| e0678988-82e8-af00-fab7-b198d257961f | goride | 49 | 535 | 2026-04-28 |
| f5299fd7-688c-407a-770a-d410d57471b8 | goride | 189 | 74 | 2026-04-28 |
| f72c96b9-b5fd-2ab4-071e-4e0b4f10f767 | goride | 145 | 276 | 2026-04-28 |
| 29e75160-c5fd-de94-369d-062d7a9c1dae | goride | 420 | 449 | 2026-04-27 |
| 2e6c6351-6bc3-5ea1-f461-cb6866f80638 | goride | 370 | 354 | 2026-04-27 |
| 3872fc74-ca0e-72e9-358c-1f48c7e156ba | goride | 449 | 35 | 2026-04-27 |
| 4d7202df-9c23-6d99-5e5a-7e75f4199e40 | goride | 80 | 150 | 2026-04-27 |
| 7b6097d4-74f6-72e7-763c-cc76b3611699 | goride | 948 | 37 | 2026-04-27 |
| 9cafcf3c-fa75-4974-7eeb-9a924d01f2cb | goride | 924 | 600 | 2026-04-27 |
| a938a60f-2b7c-8665-7492-4a334d4b8792 | goride | 278 | 567 | 2026-04-27 |
| c9c9e971-c5e9-e054-94a4-130007097dc6 | goride | 3 | 357 | 2026-04-27 |
| cc45d007-b922-9f6d-8571-104bde201728 | goride | 932 | 531 | 2026-04-27 |
| 2676bfcf-b033-a451-c30a-bbcb49ee68d0 | goride | 432 | 300 | 2026-04-26 |
| 77599ec4-5ecb-ce50-c656-5ae22fcb0c0a | goride | 423 | 551 | 2026-04-26 |
| 8d8a8ffb-d7ec-2f90-7195-7db9a53ccd65 | goride | 225 | 394 | 2026-04-26 |
| 9481b8f7-c50b-f563-3299-a86f72a124ce | goride | 207 | 218 | 2026-04-26 |
| 98379277-dbcd-e29b-23ab-098edb881ee8 | goride | 935 | 494 | 2026-04-26 |
| 9d5bcce6-c4e3-ef4e-cd9c-f5aaebb56545 | goride | 211 | 207 | 2026-04-26 |
| b517c38e-606e-cf68-2d33-f0bba27f6816 | goride | 916 | 362 | 2026-04-26 |
| b820b56f-6fb9-96f3-1f9c-573d8fc01a4d | goride | 25 | 448 | 2026-04-26 |
| bcc47f99-557c-4659-6c51-5f59736fcdc5 | goride | 456 | 194 | 2026-04-26 |
| bfd3f7c1-bfc9-9d8e-c682-ee5275268ab8 | goride | 482 | 202 | 2026-04-26 |
| fd5a24f8-a1c2-08e9-3942-739e874c2c4f | goride | 909 | 101 | 2026-04-26 |
| 354f7c6c-3803-67d7-7bdc-659d1efec2c7 | goride | 231 | 438 | 2026-04-25 |
| 4b23b180-8dda-192c-da18-17d80435d25f | goride | 219 | 208 | 2026-04-25 |
| 4cf2a2fb-a88c-b160-08e9-5a964fda2d32 | goride | 343 | 42 | 2026-04-25 |
| 85c440f1-c2f3-74fe-357a-acbe5863e5b3 | goride | 408 | 289 | 2026-04-25 |


## Q25
| zone_name | trip_count | total_revenue | average_revenue |
|---|---:|---:|---:|
| Charlottenburg | 1490 | 58164.11 | 39.0363 |
| Prenzlauer Berg | 1380 | 52937.21 | 38.3603 |
| Moabit | 1379 | 52756.18 | 38.2568 |
| Schoneberg | 733 | 28010.15 | 38.2130 |
| Wedding | 1437 | 54681.57 | 38.0526 |
| Tempelhof | 1404 | 53370.81 | 38.0134 |
| Mitte | 1464 | 55001.80 | 37.5695 |
| Lichtenberg | 758 | 28457.79 | 37.5433 |
| Treptow | 712 | 26610.97 | 37.3750 |
| Pankow | 712 | 26589.26 | 37.3445 |
| Neukolln | 1461 | 54276.72 | 37.1504 |
| Friedrichshain | 1463 | 54129.22 | 36.9988 |
| Kreuzberg | 1400 | 51470.67 | 36.7648 |
| Wilmersdorf | 1344 | 49372.73 | 36.7357 |
| Marzahn | 751 | 27420.54 | 36.5120 |
| Steglitz | 714 | 26019.65 | 36.4421 |
| Spandau | 682 | 24668.14 | 36.1703 |
| Reinickendorf | 722 | 26044.76 | 36.0731 |