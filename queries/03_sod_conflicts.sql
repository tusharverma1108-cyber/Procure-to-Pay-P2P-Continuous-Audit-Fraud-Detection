SELECT 
    i.invoice_id,
    po.po_id,
    po.vendor_id,
    po.created_by AS po_creator,
    i.entered_by AS invoice_entry_user,
    i.invoice_amount,
    'Critical Risk: SoD Violation (Initiator and Processor are identical)' AS audit_flag
FROM invoices i
JOIN purchase_orders po ON i.po_id = po.po_id
WHERE po.created_by = i.entered_by;
