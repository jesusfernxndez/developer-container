FROM alpine

ARG USERNAME
ARG NAME
ARG EMAIL

WORKDIR /root

RUN apk add --no-cache zsh curl unzip git vim
COPY setup.sh .
RUN ./setup.sh
COPY .zshrc .
RUN git --version
RUN git config --global user.name "$NAME" \
    && git config --global user.email "$EMAIL" \
    && git config --global init.defaultBranch main

CMD ["/bin/zsh"]