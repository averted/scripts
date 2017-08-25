#!/bin/bash
# Canada Post tracking
source ./config/config.cfg

# Canada Post tracking endpoint
ENDPOINT="https://soa-gw.canadapost.ca/vis/track/pin/$cp_tracking_number/summary"

# Build auth header
KEY_BASE64=$( echo -n "$cp_username:$cp_password" | base64 )
AUTH_HEADER="Authorization: Basic $KEY_BASE64"

# Response
curl -H "$AUTH_HEADER" --request GET "$ENDPOINT" > ./etc/file.xml

xmllint --format ./etc/file.xml

exit 0
