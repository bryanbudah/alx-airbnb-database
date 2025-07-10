-- 🔄 INNER JOIN: Retrieve all bookings and the users who made them
SELECT
    booking.id AS booking_id,
    booking.start_date,
    booking.end_date,
    "user".name AS user_name,
    "user".email
FROM
    booking
INNER JOIN "user" ON booking.user_id = "user".id;


-- 🔄 LEFT JOIN: Retrieve all properties and their reviews (including properties with no reviews)
SELECT
    property.id AS property_id,
    property.title,
    review.rating,
    review.comment
FROM
    property
LEFT JOIN review ON property.id = review.property_id;


-- 🔄 FULL OUTER JOIN: Retrieve all users and all bookings, even unmatched ones
SELECT
    "user".id AS user_id,
    "user".name AS user_name,
    booking.id AS booking_id,
    booking.start_date,
    booking.end_date
FROM
    "user"
FULL OUTER JOIN booking ON "user".id = booking.user_id;
-- Retrieve all properties and their reviews (if any), including properties without reviews
SELECT 
    p.property_id,
    p.title AS property_title,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.property_id;
