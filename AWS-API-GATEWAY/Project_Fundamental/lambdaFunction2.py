import json

def lambda_handler(event, context):
    
    print(f'event: {event}')
    print(f'Posting user details')
    # save the information database
    
    return {
        'statusCode': 200,
        'body': json.dumps('User added')
    }
