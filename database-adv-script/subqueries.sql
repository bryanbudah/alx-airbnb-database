-- 1️⃣ Non-correlated Subquery:
-- Find all properties where the average rating is greater than 4.0

SELECT
    property.id,
    property.title,
    property.location
FROM
    property
WHERE
    property.id IN (
        SELECT
            review.property_id
        FROM
            review
        GROUP BY
            review.property_id
        HAVING
            AVG(review.rating) > 4.0
    );


-- 2️⃣ Correlated Subquery:
-- Find users who have made more than 3 bookings

SELECT
    "user".id,
    "user".name,
    "user".email
FROM
    "user"
WHERE (
    SELECT COUNT(*)
    FROM booking
    WHERE booking.user_id = "user".id
) > 3;
SELECT
    "user".id,
    "user".name,
    "user".email
FROM
    "user"
WHERE (
    SELECT COUNT(*)
    FROM booking
    WHERE booking.user_id = "user".id
) > 3;
