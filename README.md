# Develop base repository	{#dev_base}

### How to use
```{.sh}
PROJECT_NAME='cub3d'
git clone --recursive git@github.com:kamitsui/Develop_Base.git ${PROJECT_NAME}
cd ${PROJECT_NAME}
NEW_REPOSITORY='cpp_module'
git remote set-url origin ${NEW_REPOSITORY}
mv README.md docs/dev_base.md
mv _README.md README.md
vim README.md # fix for project
```

### Features in this repository

1. Develop Environ with using docker
> [docker/README.md](docker/README.md)
>
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

### About
* Intra name : [kamitsui](https://profile.intra.42.fr/users/kamitsui) / GitHub : [kamitsui](https://github.com/kamitsui)

Joined the 42Tokyo in the same year (2023.1)
