workflow {

    // Quick parameter debug    
    Channel.of([        
    "=== PARAMETERS ===",        
    // "Batch: ${batch_id}",        
    "S3: ${params.s3_bucket}",        
    "API Get: ${params.api_link_get}",        
    "API Post: ${params.api_link_post}",        
    "Auth Key: ${secrets.api_auth_key }",        
    "=================="    ]).flatten().view()
}