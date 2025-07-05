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
