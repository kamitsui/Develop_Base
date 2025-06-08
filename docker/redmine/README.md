```sh
docker run -p3000:3000 -v$PWD/sqlite:/usr/src/redmine/sqlite -v$PWD/files:/usr/src/redmine/files -d redmine:4.2.9-alpine
```

---

## make directory for mount docker container
```sh
mkdir ../redmine_file_data
mkdir ../redmine_db_data
```

## SSH key

1. Generate key pare ( Redmine exclusive )
```sh
ssh-keygen -t ed25519 -C "redmine-github-deploy-key" -f redmine_github_deploy_key
```

2. Add publick key to GitHub

3. Mount key in the Redmine container
example
```yml
version: "3.8"
services:
  redmine:
    # ... your other redmine configurations ...
    volumes:
      - ./redmine_github_deploy_key:/root/.ssh/id_ed25519 #mount the private key.
      - ./git-repo:/usr/src/redmine/git-repo #mount your local git repository.
      - redmine_data:/usr/src/redmine/files
    # ...
    command: bash -c "chmod 600 /root/.ssh/id_ed25519 && bundle exec rails server -b 0.0.0.0" #set correct permissions.
volumes:
  redmine_data:
```
