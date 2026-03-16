# Introduction

This is my go to service launcher for MVTS related services. 
Here, I can easily launch rabbitmq, kafka, postgres, pact or any other service.
And as always, there are certain configurations that I'll surely forget.
So ..., here is a quick read me to reenergise my neuron. 

## Before all

First create a directory with any name. Let's say mvts_data.
Create a `.env` file in the same directory as `docker-compose.yml`. 
Define an entry inside .env as follows.

```text
MVTS_DATA_DIR=mvts_data
```

## Test MVTS image building and push to registery

You can provide the root directory of MVTS and it will build the directory and save it in local registory.

### Build mvts image and push to local docker registry

```bash 
make MVTS_PROJECT_DIR=~/Projects/GreyOrange/mvts/f3/
```

## Run an image 

You can provide a MVTS_IMAGE, which can be local registory or cloud image.

### .env
```text
MVTS_DATA_DIR=<path to data directory>
MVTS_IMAGE=localhost:5000/multifleet_planner
MVTS_VERSION=7.4.0-82-gb28fd2e-dirty
```

### Pull the image and launch 
```bash
make run
```

## Influxdb and grafana

This can be done for checking influx logging

```bash
docker compose up -d -- grafana
```

## Dev environment 

The dev environment can be installed with a particular project mounted using HOST_DIR environemnt variable. The dev container comes with java 21 and python 3 installed. You can also trigger openclaw and have the agent full access to the mounted volumes. 

```bash
HOST_DIR=/Users/shubham.kumar/Projects/GreyOrange/mvts/vrp-obts-rec podman compose up -d --build -- dev
```

First things you wanna do -
1. gh auth login
2. openclaw onboard
