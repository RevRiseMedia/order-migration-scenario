-- This is a snippet designed for this scenario
-- This schema is intentionally full of issues you should work to identify and fix to the best of your ability

-- CUSTOMERS
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT NOT NULL,
    customer_contact_name VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(20),
    address TEXT NOT NULL,
    address_state TEXT NOT NULL,
    customer_balance FLOAT NOT NULL DEFAULT 0.0
);

-- ORDERS
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_ref INT NOT NULL,  -- A reference to the parent order for performance tracking
    customer_id INT NOT NULL REFERENCES customers,
    order_schedule BIT(336) NOT NULL DEFAULT '0'::bit(336), -- A bitmap representing schedules as binary 7-day * 24-hour * 30-min period on/off state.
    delivery_script_name TEXT, -- If delivery, the name of the delivery
    delivery_script_args JSON, -- Arguments to supply to the delivery
    order_amount INT NOT NULL DEFAULT 0,
    order_status TEXT NOT NULL DEFAULT 'pending',
    CONSTRAINT chk_status CHECK (order_status IN ('pending', 'active', 'paused', 'cancelled', 'expired', 'recreated'))
);
