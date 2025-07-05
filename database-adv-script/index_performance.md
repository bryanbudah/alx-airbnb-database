c# Index Performance Evaluation

## Objective
Evaluate and implement indexes to improve performance of high-usage queries in the Airbnb database system.

---

## Tables Involved
- `users`
- `bookings`
- `properties`

---

## Target Columns for Indexing

| Table      | Column           | Reason                          |
|------------|------------------|---------------------------------|
| users      | email            | Used in filtering/login         |
| bookings   | user_id          | JOIN with users                 |
| bookings   | property_id      | JOIN with properties            |
| bookings   | created_at       | ORDER BY recent bookings        |
| properties | location         | Frequently filtered             |
| properties | price_per_night  | Sorted/filtered in listings     |

---

## Sample Query Tested

```sql
SELECT * FROM bookings
WHERE user_id = 42
ORDER BY created_at DESC;
