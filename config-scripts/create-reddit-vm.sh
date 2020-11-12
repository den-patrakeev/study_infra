#! /bin/bash

gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image reddit-base-1605123093 \
  --machine-type=f1-micro \
  --tags puma-server \
  --preemptible \
  --restart-on-failure

