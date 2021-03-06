# the base miniconda3 image
FROM continuumio/miniconda3:latest

# load in the environment.yml file - this file controls what Python packages we install
ADD environment.yml /


# install the Python packages we specified into the base environment
RUN conda update -n base conda -y && conda env update

# download the coder binary, untar it, and allow it to be executed
RUN wget -O code-server.tar.gz https://github.com/codercom/code-server/releases/download/1.604-vsc1.32.0/code-server1.604-vsc1.32.0-linux-x64.tar.gz \
    && mkdir -p /code-server \\
    && tar -xzvf code-server.tar.gz -C /code-server --strip-components=1 \
    && chmod +x /code-server/code-server

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]