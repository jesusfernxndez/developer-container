FROM alpine

RUN apk update \
    && apk add --no-cache sudo bash zsh curl wget openssh-client vim nano git

ARG USERNAME
ARG NAME
ARG EMAIL

RUN sed -i "s|/bin/sh|$(which zsh)|" /etc/passwd
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

COPY .zshrc /root/.zshrc

RUN git config --global user.name "$NAME" \
    && git config --global user.email "$EMAIL" \
    && git config --global init.defaultBranch main

CMD [ "zsh" ]
