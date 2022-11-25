#!/bin/bash
 curl -sS https://www.ai-fitness.de/club-checkin-number/20/Ai.AiFitnessTld | jq -c --arg datum "$(date +%s)" '{"maxCheckinsAllowed":.maxCheckinsAllowed,"countCheckedInCustomer":.countCheckedInCustomer,"date":$datum}'
