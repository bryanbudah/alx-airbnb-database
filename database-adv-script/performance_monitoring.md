SELECT * FROM bookings
WHERE user_id = 42
ORDER BY created_at DESC
LIMIT 10;

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 42
ORDER BY created_at DESC
LIMIT 10;

CREATE INDEX idx_booking_user_created_at ON bookings(user_id, created_at DESC);

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 42
ORDER BY created_at DESC
LIMIT 10;

Index Scan using idx_booking_user_created_at on bookings
(cost=0.30..8.50 rows=10 width=...)
Execution Time: 0.889 ms

# Database Performance Monitoring Report

## 🎯 Objective

Monitor and improve performance of frequently used queries by analyzing execution plans and adjusting schema where needed.

---

## 🧪 Query Monitored

```sql
SELECT * FROM bookings
WHERE user_id = 42
ORDER BY created_at DESC
LIMIT 10;

CREATE INDEX idx_booking_user_created_at ON bookings(user_id, created_at DESC);


