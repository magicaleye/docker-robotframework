#!/usr/bin/env bash
# Set default value for RERUN if not set
RERUN="${RERUN:-false}"

if [ "$RERUN" = "true" ]; then
    # Commands for rerun=true
    echo "Rerun for failed tests..."
    CMD1="robot -v BROWSER:$BROWSER -v BROWSER_VERSION:$BROWSER_VERSION -v headless:True --rerunfailed $OUTPUT_DIR/output.xml --output rerun.xml -d $OUTPUT_DIR ./testcases"
    CMD2="rebot -d $OUTPUT_DIR --output output.xml --merge $OUTPUT_DIR/*.xml"

    echo "${CMD1}"
    eval "${CMD1}"

    echo "${CMD2}"
    eval "${CMD2}"
else
    # Default command
    echo "Tests start..."
    CMD="robot $TAG -v BROWSER:$BROWSER -v BROWSER_VERSION:$BROWSER_VERSION -v headless:True -d $OUTPUT_DIR ./testcases"
    echo "${CMD}"
    eval "${CMD}"
fi
