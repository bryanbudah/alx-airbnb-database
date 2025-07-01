# 🔄 Advanced SQL Joins – ALX Airbnb Database

## 🎯 Objective

Master SQL joins by writing complex queries using:
- `INNER JOIN`
- `LEFT JOIN`
- `FULL OUTER JOIN`

---

## 📘 Description of Queries

### 1. 🔗 INNER JOIN: Bookings and Users

Returns all bookings **with users who made them**.

```sql
SELECT
    Booking.id AS booking_id,
    Booking.start_date,
    Booking.end_date,
    User.name AS user_name,
    User.email
FROM
    Booking
INNER JOIN User ON Booking.user_id = User.id;

# 🔍 Subqueries – ALX Airbnb Database

## 🎯 Objective

Demonstrate use of both **non-correlated** and **correlated subqueries** in SQL.

---

## 🧾 Included Queries

### 1️⃣ Non-correlated Subquery

**Task:** Find properties with an average rating greater than 4.0

```sql
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
# 📊 Aggregations & Window Functions – ALX Airbnb Database

## 🎯 Objective

Use SQL aggregation functions and window functions to analyze booking data.

---

## 🔢 Queries Included

### 1️⃣ Aggregation – Total Bookings per User

Counts how many bookings each user has made.

```sql
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
