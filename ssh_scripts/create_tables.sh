# Copy files from s3 buckets to hadoop's local directory
aws s3 cp s3://{directory_name}/files/ ./data/ --recursive
aws s3 cp s3://{directory_name}/sql_scripts/ ./sql_scripts/ --recursive

# Run SQL script to create tables
hive -f ./sql_scripts/create_tables_indirectly_s3.sql