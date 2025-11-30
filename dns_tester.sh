#!/bin/bash
# Script: dns_tester.sh
# Checks DNS resolution for targets using two different DNS servers.

REPORT_FILE="dns_check_$(date +%Y%m%d_%H%M%S).log"
DOMAIN_LIST="target_domains.txt"
DNS_SERVER_1="8.8.8.8"    
DNS_SERVER_2="1.1.1.1"    

echo "--- DNS Resolution Test Report ---" > "$REPORT_FILE"
echo "Checking domains against $DNS_SERVER_1 and $DNS_SERVER_2" >> "$REPORT_FILE"

while IFS= read -r DOMAIN || [[ -n "$DOMAIN" ]]; do
    if [ -z "$DOMAIN" ]; then continue; fi
    
    echo "Testing: $DOMAIN" >> "$REPORT_FILE"

    # Query Server 1
    RESULT_1=$(dig +short @$DNS_SERVER_1 "$DOMAIN" | head -n 1)
    echo "  Server $DNS_SERVER_1: $RESULT_1" >> "$REPORT_FILE"

    # Query Server 2
    RESULT_2=$(dig +short @$DNS_SERVER_2 "$DOMAIN" | head -n 1)
    echo "  Server $DNS_SERVER_2: $RESULT_2" >> "$REPORT_FILE"

    if [ -z "$RESULT_1" ] || [ -z "$RESULT_2" ]; then
        echo "  *** ALERT: Resolution FAILED for $DOMAIN on one or more servers. ***" >> "$REPORT_FILE"
    fi
    echo "" >> "$REPORT_FILE"

done < "$DOMAIN_LIST"

echo "Check Complete. Report saved to $REPORT_FILE"
