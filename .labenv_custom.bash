#!/usr/bin/false
# shellcheck shell=bash
## .labven_custom.bash: This script is intended to be sourced, additional environment customizations

# Set up 
declare -x AE_REGION=europe-west

# set the metrics-writer URL, ignoring if not present
get_writer_url() {
  WRITER_URL="$(gcloud run services describe metrics-writer --format='value(status.url)' 2> /dev/null)"
  export WRITER_URL
}
# set the working directory
declare -x WORKDIR="$HOME/cnpw"

# set the Cloud Run (fully managed) region
echo "Setting Cloud Run region to $REGION..."
gcloud config set run/region "$REGION"

# set Cloud Run managed platform
echo "Setting Cloud Run platform to managed"
gcloud config set run/platform managed 2>/dev/null
