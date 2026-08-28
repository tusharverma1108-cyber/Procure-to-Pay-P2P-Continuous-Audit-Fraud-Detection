WITH Duplicate_Invoices AS (
    SELECT 
        vendor_id,
        invoice_number,
        invoice_amount,
        COUNT(*) AS occurrence_count,
        STRING_AGG(CAST(invoice_id AS VARCHAR), ', ') AS flagged_invoice_ids
    FROM invoices
    GROUP BY vendor_id, invoice_number, invoice_amount
    HAVING COUNT(*) > 1
)
SELECT 
    vendor_id,
    invoice_number,
    invoice_amount,
    occurrence_count,
    flagged_invoice_ids,
    'High Risk: Potential Duplicate Payment' AS audit_recommendation
FROM Duplicate_Invoices;
