#!/usr/bin/env bash
CMD="robot $TAG -v BROWSER:$BROWSER -v BROWSER_VERSION:$BROWSER_VERSION -v headless:$headless -d ./reports ./testcases"

echo "${CMD}"

# Execute the command
eval "${CMD}"