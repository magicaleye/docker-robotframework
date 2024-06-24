#!/usr/bin/env bash
set -e

if [ -z "$BROWSER" ]; then
    BROWSER=""
fi

CMD="robot $TAG -v BROWSER:$BROWSER -v BROWSER_VERSION:$BROWSER_VERSION -d ./reports ./testcases"

echo "${CMD}"

# Execute the command
eval "${CMD}"