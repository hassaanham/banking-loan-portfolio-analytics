SELECT COUNT(*) AS raw_rows
FROM raw_applications;

SELECT COUNT(*) AS clean_rows
FROM applications;


SELECT
    application_id,
    COUNT(*) AS times_found
FROM raw_applications
GROUP BY application_id
HAVING COUNT(*) > 1;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT application_id) AS unique_applications
FROM applications;

SELECT
    channel,
    COUNT(*) AS application_count
FROM applications
GROUP BY channel;


SELECT
    COUNT(*) AS completed_decisions,
    ROUND(AVG(document_days), 2) AS avg_document_days,
    ROUND(AVG(queue_days), 2) AS avg_queue_days,
    ROUND(AVG(review_days), 2) AS avg_review_days,
    ROUND(AVG(decision_days), 2) AS avg_total_days
FROM application_metrics
WHERE is_decisioned = 1;

SELECT
    branch_id,
    COUNT(*) AS completed_decisions,
    ROUND(AVG(queue_days), 2) AS avg_queue_days
FROM application_metrics
WHERE is_decisioned = 1
    AND channel = 'Branch'
GROUP BY branch_id
ORDER BY avg_queue_days DESC;

SELECT
    COUNT(*) AS completed_decisions,
    SUM(within_target) AS decisions_within_7_days,
    ROUND(100.0 * AVG(within_target), 1) AS within_target_pct
FROM application_metrics
WHERE is_decisioned = 1;

SELECT
    COUNT(*) AS open_applications,
    SUM(CASE WHEN open_age_days > 7 THEN 1 ELSE 0 END)
        AS open_over_7_days,
    ROUND(
        100.0 * SUM(CASE WHEN open_age_days > 7 THEN 1 ELSE 0 END)
        / COUNT(*),
        1
    ) AS overdue_open_pct
FROM application_metrics
WHERE status = 'Open';

SELECT
    missing_docs_at_intake,
    COUNT(*) AS completed_decisions,
    ROUND(AVG(decision_days), 2) AS avg_total_days
FROM application_metrics
WHERE is_decisioned = 1
GROUP BY missing_docs_at_intake
ORDER BY missing_docs_at_intake;
