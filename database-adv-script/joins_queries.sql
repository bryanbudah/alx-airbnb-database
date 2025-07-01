-- 🔄 INNER JOIN: Bookings with the users who made them
SELECT
    Booking.id AS booking_id,
    Booking.start_date,
    Booking.end_date,
    User.name AS user_name,
    User.email
FROM
    Booking
INNER JOIN User ON Booking.user_id = User.id;

-- 🔄 LEFT JOIN: Properties with their reviews (include properties with no reviews)
SELECT
    Property.id AS property_id,
    Property.title,
    Review.rating,
    Review.comment
FROM
    Property
LEFT JOIN Review ON Property.id = Review.property_id;

-- 🔄 FULL OUTER JOIN: All users and all bookings (even unmatched ones)
SELECT
    User.id AS user_id,
    User.name AS user_name,
    Booking.id AS booking_id,
    Booking.start_date,
    Booking.end_date
FROM
    User
FULL OUTER JOIN Booking ON User.id = Booking.user_id;
SELECT
    Property.id AS property_id,
    Property.title,
    Review.rating,
    Review.comment
FROM
    Property
LEFT JOIN Review ON Property.id = Review.property_id;
SELECT
    User.id AS user_id,
    User.name AS user_name,
    Booking.id AS booking_id,
    Booking.start_date,
    Booking.end_date
FROM
    User
FULL OUTER JOIN Booking ON User.id = Booking.user_id;
