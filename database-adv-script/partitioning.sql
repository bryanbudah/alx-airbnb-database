-- 1. Drop original table (if testing from scratch)
DROP TABLE IF EXISTS bookings CASCADE;

-- 2. Create partitioned parent table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (start_date);

-- 3. Create partition tables (by year)
CREATE TABLE bookings_2022 PARTITION OF bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- 4. Optional: Default partition for other dates
CREATE TABLE bookings_default PARTITION OF bookings
    DEFAULT;
-- Run before partitioning
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31';
-- Run after partitioning
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31';

SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31';

-- Insert sample bookings for different years
INSERT INTO bookings (user_id, property_id, start_date, end_date, created_at)
SELECT 
    (RANDOM() * 100)::INT,
    (RANDOM() * 50)::INT,
    (DATE '2022-01-01' + (RANDOM() * 365)::INT),  -- Random date in 2022
    (DATE '2022-01-02' + (RANDOM() * 5)::INT),
    NOW()
FROM generate_series(1, 1000);

INSERT INTO bookings (user_id, property_id, start_date, end_date, created_at)
SELECT 
    (RANDOM() * 100)::INT,
    (RANDOM() * 50)::INT,
    (DATE '2023-01-01' + (RANDOM() * 365)::INT),  -- Random date in 2023
    (DATE '2023-01-02' + (RANDOM() * 5)::INT),
    NOW()
FROM generate_series(1, 1000);

INSERT INTO bookings (user_id, property_id, start_date, end_date, created_at)
SELECT 
    (RANDOM() * 100)::INT,
    (RANDOM() * 50)::INT,
    (DATE '2024-01-01' + (RANDOM() * 365)::INT),  -- Random date in 2024
    (DATE '2024-01-02' + (RANDOM() * 5)::INT),
    NOW()
FROM generate_series(1, 1000);

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31';

SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31';
