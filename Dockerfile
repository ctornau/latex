# Use the latest Ubuntu release
FROM ubuntu:latest

# Get full LaTeX with texlive installed with the normal packaged apt-get installation process
# After that the cache is purged to save image space
RUN apt-get update && \
    apt-get install -y lsb-release && \
    apt-get install -y curl && \
    apt-get install -y tzdata && \
    apt-get install -y texlive-full && \
    apt-get purge -y *-doc && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

# Display distribution specific information
RUN lsb_release -a
