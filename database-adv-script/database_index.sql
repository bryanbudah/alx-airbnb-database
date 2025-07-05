-- User table indexes
CREATE INDEX idx_user_email ON users(email);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_created_at ON bookings(created_at);

-- Property table indexes
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_price ON properties(price_per_night);

-- Before index
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 42 ORDER BY created_at DESC;

-- After index is created
CREATE INDEX idx_booking_user_id ON bookings(user_id);
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 42 ORDER BY created_at DESC;

