#!/bin/bash


# Change to the terraform directory
# cd terraform
# can also use terraform -chdir=DIR cmd
DIR=${2:-.}

# Check the first argument to determine which Terraform command to run
case "$1" in
  "init")
    terraform -chdir=$DIR init
    ;;
  "plan")
    terraform -chdir=$DIR plan
    ;;
  "apply")
    terraform -chdir=$DIR apply
    ;;
  "destroy")
    terraform -chdir=$DIR destroy
    ;;
  *)
    echo "Usage: $0 {init|plan|apply|destroy}"
    exit 1
    ;;
esac

# Return to the project root directory
# cd ..
