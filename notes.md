# GoRide Assignment – Personal Reflection

## 1. Data quirks and how I handled them

One of the big issues we came across in the GoRide data was that the same information wasn't always stored in the same format. Zone names for instance were sometimes stored with hyphens in, sometimes with extra spaces, and sometimes with different capitalisation. I dealt with that by using TRIM(), LOWER() and REPLACE() to get the zone names into a consistent format. There was also the issue of the different status values used by GoRide and QuickHop (QuickHop used `finished` rather than `completed' for instance). We also had to be careful with the payment correction flag as some of the package payments were incorrectly tagged as rides.

## 2. The two questions I found hardest

Q20 and Q24 were the ones that really tripped me up. Q20 was about combining the ride and package delivery revenue to work out the average monthly revenue per driver. That in itself was not a problem, but I had to be very careful about what I included in that calculation. I had to take into account successful payments, corrected service types, completed activities and drivers who had been merged between the two systems. Q24 was also a bit of a challenge as I had to check that every completed trip had a valid driver and vehicle assignment on the trip date. I looked at the assignment table columns and used a NOT EXISTS to flag up any trips which didn't have a valid assignment.

## 3. What I learned from working with multi-source data

The key thing I've learned from this exercise is that joining data from different sources isn't just about joining tables. The same type of data can be stored in very different ways in two systems. An ID in one system may not represent a different person to the ID in another. Status values can have different meanings. A payment record in one system may be a retry of a previous payment. If you don't take these differences into account you can end up with completely wrong results. You have to understand the data structure and the quality of the data before you go and start calculating any metrics or making any business decisions. I think that's a lesson I'll take with me into my future data science projects.