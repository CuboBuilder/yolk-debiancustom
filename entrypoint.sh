#!/bin/bash
cd /home/container

MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')

echo -e "\033[1;33mStarting with:\033[0m"
echo -e "\033[1;32m${MODIFIED_STARTUP}\033[0m"

eval ${MODIFIED_STARTUP}
