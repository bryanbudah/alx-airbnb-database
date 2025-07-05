# Optimization Report

## 🎯 Objective
Refactor a complex query retrieving bookings with user, property, and payment details to improve performance.

---

## 🔍 Initial Query
```sql
SELECT 
    b.id, b.created_at, u.id, u.name, u.email,
    p.id, p.title, p.location,
    pay.id, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
-- Initial query: retrieve all bookings with user, property, and payment details
SELECT 
    b.id AS booking_id,
    b.created_at AS booking_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
