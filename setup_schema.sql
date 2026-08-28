-- Create Purchase Orders Table
CREATE TABLE purchase_orders (
    po_id INT PRIMARY KEY,
    vendor_id VARCHAR(10),
    po_amount DECIMAL(10, 2),
    created_by VARCHAR(20),
    po_date DATE
);

-- Create Invoices Table
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    po_id INT,
    vendor_id VARCHAR(10),
    invoice_number VARCHAR(20),
    invoice_amount DECIMAL(10, 2),
    invoice_date DATE,
    entered_by VARCHAR(20)
);

-- Populate Purchase Orders (Includes split PO threshold bypass)
INSERT INTO purchase_orders VALUES 
(101, 'VND_001', 9500.00, 'USER_A', '2026-03-01'),
(102, 'VND_001', 9800.00, 'USER_A', '2026-03-01'), -- Split PO flag (< 10,000 threshold)
(103, 'VND_002', 45000.00, 'USER_B', '2026-03-05');

-- Populate Invoices (Includes duplicate payment & SOD exceptions)
INSERT INTO invoices VALUES 
(1, 101, 'VND_001', 'INV-2026-001', 9500.00, '2026-03-02', 'USER_A'), -- SOD violation: created PO and entered invoice
(2, 101, 'VND_001', 'INV-2026-001', 9500.00, '2026-03-04', 'USER_C'), -- Duplicate payment flag
(3, 103, 'VND_002', 'INV-2026-002', 45000.00, '2026-03-06', 'USER_D');
