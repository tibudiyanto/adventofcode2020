.mode csv
.import input input


-- First half
SELECT DISTINCT t1.value * t2.value
FROM input t1, input t2 
WHERE t1.value + t2.value = 2020;

-- Second half
SELECT DISTINCT t1.value * t2.value * t3.value
FROM input t1, input t2, input t3
WHERE t1.value + t2.value + t3.value = 2020;