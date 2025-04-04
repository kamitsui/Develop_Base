docker run --rm --name redmine -p3000:3000 \
	-v$PWD/sqlite:/usr/src/redmine/sqlite \
	-v$PWD/files:/usr/src/redmine/files \
	-v ./ssh/config:/home/redmine/.ssh/config \
	-v ./redmine_github_deploy_key:/root/.ssh/id_ed25519 \
	-v ./redmine_github_deploy_key.pub:/root/.ssh/id_ed25519.pub \
	-d redmine:4.2.9-alpine
	#-v ./tmp-repo:/usr/src/redmine/git-repo \
	#-v ./ssh/config:/root/.ssh/config \
	#-v ./redmine_github_deploy_key:/root/.ssh/id_ed25519 \
