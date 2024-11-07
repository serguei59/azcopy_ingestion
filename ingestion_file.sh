#!/bin/bash

#Load environment variables from .env file
if [ -f .env ]; then
    source .env
else
    echo ".env not found, please create one with the required variables"
    exit 1
fi

#Construct destination URL with SAS Token
DEST_URL="https://${STORAGE_ACCOUNT}.dfs.core.windows.net/${CONTAINER_NAME}?${SAS_TOKEN}"

#upload the file or repertory here using AzCopy 
echo "Uploading $LOCAL_FILE_PATH to Azure Blob storage..."
azcopy copy "$LOCAL_FILE_PATH" "$DEST_URL" --from-to=LocalBlob --recursive=true

#success control of azcopy command
if [ $? -eq 0 ]; then
    echo "File uploaded succesfully!"
else
    echo "File upload failed."
fi