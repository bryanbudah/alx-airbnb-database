a-- 1️⃣ Aggregation: Total number of bookings made by each user
SELECT
    "user".id AS user_id,
    "user".name AS user_name,
    COUNT(booking.id) AS total_bookings
FROM
    "user"
LEFT JOIN booking ON "user".id = booking.user_id
GROUP BY
    "user".id,
    "user".name
ORDER BY
    total_bookings DESC;


-- 2️⃣ Window Function: Rank properties by total number of bookings
SELECT
    property.id AS property_id,
    property.title,
    COUNT(booking.id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(booking.id) DESC) AS booking_rank
FROM
    property
LEFT JOIN booking ON property.id = booking.property_id
GROUP BY
    property.id, property.title
ORDER BY
    booking_rank;
SELECT
    property.id AS property_id,
    property.title,
    COUNT(booking.id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(booking.id) DESC) AS booking_rank
FROM
    property
LEFT JOIN booking ON property.id = booking.property_id
GROUP BY
    property.id, property.title
ORDER BY
    booking_rank;
