FROM gitpod/workspace-full

USER root

RUN groupadd --gid 999 docker && useradd -l -u 1001 -G sudo,docker -md /home/devpod -s /bin/bash devpod && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers;
  
ENV HOME=/home/devpod
WORKDIR $HOME
RUN { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> .bashrc

USER devpod
RUN sudo echo "Running 'sudo' for Devpod: success"

USER root
