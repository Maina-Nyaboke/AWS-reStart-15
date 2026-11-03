-- =============================================================================
# AWS Security Operations: Serverless Log Analysis Engine
# Query Platform: Amazon Athena / Target Source Pool: AWS CloudTrail S3 Logs
# Purpose: Isolating Unauthorized API Handshakes and Account Vulnerabilities
-- =============================================================================

SELECT 
    eventtime,
    eventsource,
    eventname,
    awsregion,
    sourceipaddress,
    useridentity.arn AS user_identity_arn,
    errorcode,
    errormessage
FROM 
    secure_cloudtrail_log_vault
WHERE 
    errorcode = 'AccessDenied' 
    OR errorcode = 'UnauthorizedOperation'
ORDER BY 
    eventtime DESC
LIMIT 50;
