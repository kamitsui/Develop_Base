# 42 environ with docker

1. Develop Environ with using docker
> ubuntu:22.04 base
>
> C language, X11

2. Documentation tools
> doxygen : generate documentation in project
>
> live-server : preview on local browser

3. CI/CD
> check local test : scripts/deploy_test_github_act.sh
>
> GitHub Actions : deploy documentation to GitHub Pages (.github/workflows/doxygen.yml)


### Usage

```{.sh}
# Build and Run container (develop environment)
docker-compose up --build -d

# End using Cub3D container : stop & remove
docker-compose down

# Inter 42_dev container
docker-compose exec 42_dev /bin/bash
# or
docker exec -it 42_dev /bin/bash

# Execute XQuartz and Allow access to XQuartz
xhost + localhost

# Display on host-docker from 42_dev-container
# Simple test ... call by 42_dev-conatiner
xeyes

# Security Note : Revoke access to XQuartz
xhost - localhost
```

### other memo
```{.sh}
# Storage driver is currently using
docker info

# Show the disk space used
docker system df

# Remove unused objects
docker system prune    # All Object : container, network, image, volume with option
docker container prune # Remove stopped containers
docker image prune     # Remove unused images (-f : skip / -a : all)
docker volume prune    # Only Volume

# BuiltKit for speedy building
export DOCKER_BUILDKIT=1
docker-compose build
# Local build cache
docker build --cache-form=my-cached-image .
# Paralel build in multiple service
docker-compose build --parallel
# Only specific servife
docker-compose build service_name
```

### Refer
docker.com : [build check](https://www.docker.com/ja-jp/blog/introducing-docker-build-checks/)
