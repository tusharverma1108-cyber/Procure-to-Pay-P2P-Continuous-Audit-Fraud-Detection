-- 1. Old Tables Clear Karein
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS purchase_orders;

-- 2. Purchase Orders Table Banayein
CREATE TABLE purchase_orders (
    po_id INT PRIMARY KEY,
    vendor_id VARCHAR(10),
    po_amount DECIMAL(10, 2),
    created_by VARCHAR(20),
    po_date DATE
);

-- 3. Invoices Table Banayein
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    po_id INT,
    vendor_id VARCHAR(10),
    invoice_number VARCHAR(20),
    invoice_amount DECIMAL(10, 2),
    invoice_date DATE,
    entered_by VARCHAR(20),
    FOREIGN KEY (po_id) REFERENCES purchase_orders(po_id)
);

-- 4. Sample Data Insert Karein (P2P Data)
INSERT INTO purchase_orders (po_id, vendor_id, po_amount, created_by, po_date) VALUES 
(101, 'VND_001', 9500.00, 'USER_A', '2026-03-01'),
(102, 'VND_001', 9800.00, 'USER_A', '2026-03-01'),
(103, 'VND_002', 45000.00, 'USER_B', '2026-03-05');

INSERT INTO invoices (invoice_id, po_id, vendor_id, invoice_number, invoice_amount, invoice_date, entered_by) VALUES 
(1, 101, 'VND_001', 'INV-2026-001', 9500.00, '2026-03-02', 'USER_A'),
(2, 101, 'VND_001', 'INV-2026-001', 9500.00, '2026-03-04', 'USER_C'),
(3, 103, 'VND_002', 'INV-2026-002', 45000.00, '2026-03-06', 'USER_D');
