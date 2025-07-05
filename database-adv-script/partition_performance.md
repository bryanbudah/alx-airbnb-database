# Partitioning Performance Report

## 🎯 Objective
Optimize performance on a large `bookings` table by implementing **range partitioning** based on the `start_date`.

---

## ⚙️ Implementation

Partitioned the `bookings` table into yearly partitions:
- `bookings_2022`
- `bookings_2023`
- `bookings_2024`
- `bookings_default`

```sql
CREATE TABLE bookings (...) PARTITION BY RANGE (start_date);
# Partitioning Performance Report

## 🎯 Objective
Optimize performance on a large `bookings` table by implementing **range partitioning** based on the `start_date`.

---

## ⚙️ Implementation

Partitioned the `bookings` table into yearly partitions:
- `bookings_2022`
- `bookings_2023`
- `bookings_2024`
- `bookings_default`

```sql
CREATE TABLE bookings (...) PARTITION BY RANGE (start_date);

---

## 🧪 Sample Data Inserted

Inserted 3,000 rows into the partitioned `bookings` table:
- 1,000 for 2022
- 1,000 for 2023
- 1,000 for 2024

```sql
-- Example insertion
INSERT INTO bookings (user_id, property_id, start_date, end_date, created_at)
SELECT ... FROM generate_series(1, 1000);
