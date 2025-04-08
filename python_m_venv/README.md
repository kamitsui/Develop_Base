# Python module venv

build by python3.13 on macOS (that is installed by brew install tools)

## How to use

#### `python_m_venv` is own environ of python project.

```
tree -a python_m_venv
python_m_venv
├── .env                   # define PRJ_DIR
├── requirements           # include requirements.txt for my project
│   ├── list.md
│   └── musicbox.txt
└── setup_project_env.sh   # create venv and link project
```

#### Create venv and Link project ( PRJ_DIR/venv -> venv )

```sh
cd python_m_venv
./setup_project_env.sh
```

#### Operation python environ in PRJ_DIR

```sh
# Enable
source python_m_venv/.env
cd ${PRJ_DIR}
source venv/bin/activate

# Install requirement packages
pip install -r requirements/project_name.txt

# Install packages to be added
pip install package_name

# Update
pip freeze > requirements/project_name.txt

# Disable
deactivate


# same below
pip [install, freeze]
python -m pip [install, freeze]
```
