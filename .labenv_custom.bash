#!/usr/bin/false
# shellcheck shell=bash
## .labven_custom.bash: This script is intended to be sourced, additional environment customizations

# Set up 
declare -x AE_REGION=europe-west1

# set the metrics-writer URL, ignoring if not present
declare -x WRITER_URL
WRITER_URL="$(gcloud run services describe metrics-writer --format='value(status.url)' 2> /dev/null)"

# set the working directory
declare -x WORKDIR="$HOME/cnpw"

# set the Cloud Run (fully managed) region
gcloud config set run/region "$REGION" 2>/dev/null
