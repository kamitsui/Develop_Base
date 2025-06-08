# Use a slim Python 3.9 image as the base
FROM python:3.9-slim

# Install system dependencies and tools
RUN apt-get update && apt-get install -y \
	curl \
	gnupg \
	build-essential \
	git \
	&& rm -rf /var/lib/apt/lists/*

# Install Node.js (using NodeSource’s setup script for Node 16 LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get update && apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Optionally verify Node and npm versions
RUN node -v && npm -v

# Install MkDocs and necessary plugins (for example, MkDocs Material)
RUN pip install --no-cache-dir \
    mkdocs \
    mkdocs-material \
	mkdocs-macros-plugin \
	mkdocs-codeinclude-plugin \
	mkdocs-mermaid2-plugin \
	mkdocs-glightbox \
	mkdocs-static-i18n

# Install staticrypt globally so that the "staticrypt" command is available.
RUN npm install -g staticrypt

# Set the working directory inside the container (adjust if needed)
WORKDIR /mkdocs

# Copy your documentation source into the container.
# This assumes your mkdocs.yml and docs folder are in the same directory as your Dockerfile.
#COPY . /docs

# Expose the port used by mkdocs serve (default: 8000)
EXPOSE 8000

# Set a default command; using bash so you can interactively run commands.
CMD [ "bash" ]
