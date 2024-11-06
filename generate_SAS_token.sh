#!/bin/bash

#load existing environment variables
if [ -f .env ]; then
    source .env
else
    echo ".env not found, please create one with the required variables"
fi

#SAS token generation
echo "Generating SAS token..."
SAS_TOKEN=$(az storage container generate-sas \
    --account-name $STORAGE_ACCOUNT \
    --name $CONTAINER_NAME \
    --permissions acdrw \
    --expiry $EXPIRY_DATE \
)

if [ -z "$SAS_TOKEN" ]; then
    echo "SAS Token generation failed."
    exit 1
fi

#Update or add SAS Token in .env
echo "Updating SAS Token in .env..."
sed -i '/SAS_TOKEN=/d' .env

echo "SAS_Token=\"$SAS_TOKEN\"" >> .env

echo "SAS Token generated and updated in .env file"





