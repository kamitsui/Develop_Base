# Devlop Environment Manager

This `dev_env_manager` repository helps you quickly set up and manage different development environments, including Docker-based containers, Doxygen documentation tools, and Python virtual environments.


***

## 🚀 Getting Started

```{.sh}
# Clone this repository
git clone git@github.com:kamitsui/dev_env_manager.git dev_env_manager
cd dev_env_manager
git submodule update --init --recursive  # clone submodule (doxygen/doxygen-awesome-css)

# Define project directory
echo "PRJ_DIR=/path/to/project" > .env
```

***

## 📁 Repository Structure

```
.
├── .env                          # Environment variables for setup.sh (EDIT THIS!)
├── setup.sh                      # Main setup script to configure environments
├── README.md                     # You are reading this!
├── docker/                       # Contains Docker configurations
│   ├── 42/                       #   └── Docker Compose setup for 42cursus projects
│   │   ├── Dockerfile
│   │   ├── README.md
│   │   └── docker-compose.yml
│   └── mkdocs/                   #   └── Docker Compose setup for MkDocs documentation
│       ├── Dockerfile
│       ├── README.md
│       └── docker-compose.yml
├── doxygen/                      # Doxygen documentation setup
│   ├── doxygen-awesome-css/      #   └── Submodule for Doxygen Awesome CSS theme
│   ├── Doxyfile                  #   └── Base Doxyfile
│   ├── setup_doxygen.sh          #   └── Helper script to configure Doxygen
│   ├── deploy_test_github_act.sh #   └── Script for deploying test documentation (e.g., GH Actions)
│   ├── watch_doxygen.sh          #   └── Script to watch and rebuild Doxygen docs
│   └── index.md                  #   └── Base Markdown for Doxygen main page
└── python_m_venv/                # Python virtual environment setup
    ├── README.md
    ├── requirements              #   └── Python package requirements
    ├── setup_project_env.sh      #   └── Script to create and configure venv
    └── venv                      #   └── (Actual venv created by setup script)
```

***

## 🛠️ Usage: `setup.sh`

### 1. Docker Environments

This command creates a symbolic link from the specified Docker configuration directory in this repository to `$(PRJ_DIR)/docker`. 

* For 42cursus:
```{.sh}
./setup.sh docker 42
```
This creates: `${PRJ_DIR}/docker_42` -> `dev-env-manager/docker/42` (symlink)

* For MkDocs:
```{.sh}
# Create a symlink : 
./setup.sh python
```
This creates: `${PRJ_DIR}/python_m_venv` -> `./python_m_venv` (symlink)

### 2. Doxygen Documentation ( ⚠️ still getting ready )

This command sets up Doxygen for your project.

```{.sh}
./setup.sh doxygen
```

This performs the following actions:

* Calls `doxygen/setup_doxygen.sh`.
* Creates `$(PRJ_DIR)/docs` directory.
* Copies `Doxyfile`, `deploy_test_github_act.sh`, `watch_doxygen.sh`, and `index.md` into `$(PRJ_DIR)/docs`.
* Creates a symbolic link: `$(PRJ_DIR)/docs/doxygen-awesome-css` -> `dev-env-manager/doxygen/doxygen-awesome-css`

### 3. Python virtual environment

This command sets up a Python virtual environment for your project.

```{.sh}
./setup.sh python
```

This creates a symbolic link:
`$(PRJ_DIR)/python_m_venv` -> `dev-env-manager/python_m_venv` (symlink)

***

## 📝 Notes

* Symlinks: This setup heavily relies on symbolic links (`ln -s`). Ensure your system supports them and you understand their behavior.
* Absolute Paths: `PRJ_DIR` must be an absolute path for `setup.sh` to work correctly from any location.
* Customization: After setup, you might need to customize the copied `Doxyfile` or `docker-compose.yml` files within your `PRJ_DIR` to fit specific project requirements.
* Doxygen Awesome CSS: If you encounter issues with `doxygen-awesome-css`, ensure the submodule is correctly initialized and updated within this `dev-env-manager` repository.

***

## Notes for each environment.

* [docker/42/README.md](docker/42/README.md)
* [python_m_venv/README.md](python_m_venv/README.md)

I'm still getting ready ( preparation )
* [docker/mkdocs/README.md](docker/mkdocs/README.md)
* [docker/redmine/README.md](docker/redmine/README.md)

***

## About me
* Intra name : [kamitsui](https://profile.intra.42.fr/users/kamitsui) / GitHub : [kamitsui](https://github.com/kamitsui)

Joined the 42Tokyo in the same year (2023.1)

***

Feel free to open an issue or pull request if you have any questions or suggestions!
