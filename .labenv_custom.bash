#!/usr/bin/false
# shellcheck shell=bash
## .labven_custom.bash: This script is intended to be sourced, additional environment customizations

# Set up 
declare -x AE_REGION="europe-west"
declare -x FS_LOCATION="eur3"

# set the metrics-writer URL, ignoring if not present
get_writer_url() {
  WRITER_URL="$(gcloud run services describe metrics-writer --format='value(status.url)' 2> /dev/null)"
  export WRITER_URL
}
# set the working directory
declare -x WORKDIR="$HOME/cnpw"

# Set the source images to use
declare -x MW_IMG="europe-southwest1-docker.pkg.dev/javiercm-main-dev/public/metrics-writer:latest"
declare -x V_IMG="europe-southwest1-docker.pkg.dev/javiercm-main-dev/public/visualizer:latest"

# set the Cloud Run (fully managed) region
echo "Setting Cloud Run region to $REGION..."
gcloud config set run/region "$REGION" --no-user-output-enabled

# set Cloud Run managed platform
echo "Setting Cloud Run platform to managed"
gcloud config set run/platform managed --no-user-output-enabled
