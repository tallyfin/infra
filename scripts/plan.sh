#!/usr/bin/env bash
set -euo pipefail

env="${1:-production}"
terraform -chdir="environments/$env" init -input=false
terraform -chdir="environments/$env" plan -input=false -out="$env.tfplan"
