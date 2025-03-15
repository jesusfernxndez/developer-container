FROM alpine

# Instalar herramientas básicas de desarrollo
RUN apk add --no-cache sudo curl wget bash zsh openssh-client unzip tar gzip vim nano git

# Crear usuario `dev` con permisos de sudo
ARG USERNAME
RUN adduser -D -h /home/$USERNAME -s /bin/zsh $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Cambiar al usuario `dev`
USER $USERNAME

# Instalar Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Git configuration
RUN git config --global user.name "Jesus Fernandez"
RUN git config --global user.email "jesus@jesusfernandez.me"
RUN git config --global init.defaultBranch main
