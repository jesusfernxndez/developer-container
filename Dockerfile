FROM ubuntu

RUN apt-get update && apt-get install -y curl wget zsh openssh-client vim git

ARG USERNAME
ARG NAME
ARG EMAIL
RUN adduser --disabled-password --gecos "" $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN git config --global user.name "$NAME" \
    && git config --global user.email "$EMAIL" \
    && git config --global init.defaultBranch main

USER root
