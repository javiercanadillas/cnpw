#!/usr/bin/env bash
# vars.bash: simple environment configuration script
# run it like this: "source vars.sh"

declare -x PROJECT_ID
PROJECT_ID=$(gcloud config get-value project)
declare -x REGION=europe-west
declare -x AE_REGION=europe-west1

# set the metrics-writer URL, ignoring if not present
declare -x WRITER_URL
WRITER_URL="$(gcloud run services describe metrics-writer --format='value(status.url)' 2> /dev/null)"

# set the working directory
declare -x WORKDIR="$HOME/cnpw"

# set the Cloud Run (fully managed) region
gcloud config set run/region $REGION
