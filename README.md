# azcopy_ingestion

how to ingest data in an azure datalake gen2 using azcopy and SAS authentication

Set up .env file:
replace the placeholder values with your actual Azure Storage account name, container name, file path and desired SAS Token expiry date

Run generate_sas_token.sh:
Make the script executable: chmod +x generate_sas_token.sh
run the script: ./generate_sas_token.sh
Generates a new SAS token and writes it, along with other configuration variables, to .env.

Run ingestion_file.sh:
Make the script executable: chmod +x ingestion_file.sh
run the script: ./ingestion_file.sh
Reads from .env and transfers the file to Azure Blob Storage using AzCopy.

Additional Tips
Security: Add .env to .gitignore to prevent it from being pushed to version control.
Token Refresh: Run generate_sas_token.sh whenever the SAS token expires or needs refreshing.



