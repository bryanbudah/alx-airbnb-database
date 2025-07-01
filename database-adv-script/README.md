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
