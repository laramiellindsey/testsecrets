process my_task {
    secret 'api_dev_auth_key'
    secret 's3_dev_bucket'
    publishDir '/results/secrets/', mode: 'copy', overwrite: true

    output:
    path 'secrets.txt'

    script:
    """
    echo "\$api_dev_auth_key, \$s3_dev_bucket" >> secrets.txt
    """
}

workflow {
    // Call the process to actually execute it
    my_task()

    // Quick parameter debug    
    Channel.of([        
        "=== PARAMETERS ===",        
        // "Batch: ${batch_id}",        
        "S3: ${params.s3_bucket}",        
        "API Get: ${params.api_link_get}",        
        "API Post: ${params.api_link_post}",        
        "Auth Key: '${params.api_auth_key }' (length: ${params.api_auth_key ?.length() ?: 'null'})",       
        "=================="    
    ]).flatten().view()
}