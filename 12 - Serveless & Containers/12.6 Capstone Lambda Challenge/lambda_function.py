# -*- coding: utf-8 -*-
# AWS Serverless Capstone Challenge: Event-Driven Word Counter Pipeline
# Runtime Target: Python 3.9+ / Client Library: boto3 (AWS SDK)
# Trigger Source: Amazon S3 Object Creation Event Notification

import urllib.parse
import boto3

# Initialize the AWS SDK client boundaries natively outside the handler
s3_client = boto3.client('s3')
sns_client = boto3.client('sns')

def lambda_handler(event, context):
    # Target ARN string mapping your downstream messaging channel
    # REPLACE this token string value with your exact copied unique SNS Topic ARN!
    SNS_TOPIC_ARN = "arn:aws:sns:us-west-2:975050244756:WordCountAlertTopic"
    
    print("--- Event Received: Initializing Serverless Word Count Processing Pipeline ---")
    
    try:
        # 1. Parse the incoming S3 event payload metadata to extract bucket and object keys
        bucket_name = event['Records'][0]['s3']['bucket']['name']
        object_key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')
        
        print(f"Target Processing Target Ingestion Source Bucket: {bucket_name}")
        print(f"Target File Name Extracted: {object_key}")
        
        # 2. Programmatically fetch the file data content from the S3 storage block
        s3_response = s3_client.get_object(Bucket=bucket_name, Key=object_key)
        file_content = s3_response['Body'].read().decode('utf-8')
        
        # 3. Execute data string splits to count total word parameters accurately
        words_array = file_content.split()
        total_words = len(words_array)
        
        print(f"Metrics Extraction Success. Computed Total Words: {total_words}")
        
        # 4. Format the exact response message string required by design specifications
        formatted_message = f"The word count in the {object_key} file is {total_words}."
        email_subject = "Word Count Result"
        
        # 5. Dispatch the payload message straight across the global SNS notification plane
        print(f"Publishing notification payload to SNS Topic: {SNS_TOPIC_ARN}")
        sns_client.publish(
            TopicArn=SNS_TOPIC_ARN,
            Message=formatted_message,
            Subject=email_subject
        )
        
        return {
            'statusCode': 200,
            'body': f"Successfully processed {object_key}. Calculated word count: {total_words}"
        }
        
    except Exception as e:
        print(f"Serverless pipeline processing failure: {str(e)}")
        raise e
