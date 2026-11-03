-- =============================================================================
# AWS Security Operations: Incident Response & Threat Hunting Suite
# Query Target: AWS CloudTrail S3 JSON Log Lake / Engine: Amazon Athena
# Case File: Café Web Server Exploitation Triage
-- =============================================================================

-- Query 1: Base Checkpoint Scan - Validate Table Ingestion Schema Integrity
SELECT 
    useridentity.userName, 
    eventtime, 
    eventsource, 
    eventname, 
    requestparameters
FROM 
    cloudtrail_logs_monitoring####
LIMIT 30;

-- Query 2: Focused Firewall Deep-Dive - Isolate Security Group Modifications
-- TARGET RESULT: Exposing user 'chaos' injecting global SSH access holes
SELECT 
    eventtime,
    useridentity.userName AS actor_username,
    eventname AS api_action,
    sourceipaddress AS attacker_source_ip,
    useridentity.userAgent AS client_user_agent,
    requestparameters AS raw_payload_json
FROM 
    cloudtrail_logs_monitoring####
WHERE 
    eventsource = '://amazonaws.com'
    AND eventname LIKE '%SecurityGroup%'
ORDER BY 
    eventtime DESC;
