#!/usr/bin/env bash
CMD="robot $TAG -v BROWSER:$BROWSER -v BROWSER_VERSION:$BROWSER_VERSION -v headless:True -d $OUTPUT_DIR ./testcases"

echo "${CMD}"

# Execute the command
eval "${CMD}"