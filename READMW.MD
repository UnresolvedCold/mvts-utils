# Introduction

## Build mvts image and push to local docker registry 

```bash 
make MVTS_PROJECT_DIR=~/Projects/GreyOrange/mvts/f3/
```

## Run an image 

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