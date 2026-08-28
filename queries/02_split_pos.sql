SELECT 
    created_by,
    vendor_id,
    po_date,
    COUNT(po_id) AS total_pos_created,
    SUM(po_amount) AS total_combined_value,
    'Medium Risk: Potential Split PO to bypass $10,000 approval limit' AS audit_recommendation
FROM purchase_orders
WHERE po_amount BETWEEN 9000 AND 9999
GROUP BY created_by, vendor_id, po_date
HAVING COUNT(po_id) > 1;
