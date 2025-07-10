# Database Schema for ALX Airbnb Clone

This schema defines the core structure for an Airbnb-like application. It includes tables for users, properties, bookings, payments, and reviews.

## Key Features

- Uses UUIDs (`CHAR(36)`) as primary keys
- Establishes proper foreign key relationships
- Includes timestamp fields for tracking record creation
- Implements indexes to improve query performance

## Tables

- **users**: Hosts and travelers
- **properties**: Listings available for booking
- **bookings**: Reservations made by users
- **payments**: Payment records linked to bookings
- **reviews**: User reviews of booked properties

## Indexes

Indexes are created on frequently queried fields like user IDs, property IDs, and emails.

---

## How to Apply

To create the database schema:

```bash
mysql -u root -p < schema.sql
