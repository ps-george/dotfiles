# Setting up PC 

# Linux
## Install Programs
### GUI
- [x] Web Browser (Chrome)
    - [ ] 1Password Extension
- [ ] Slack (https://slack.com/intl/en-gb/downloads/instructions/ubuntu)
- [ ] VSCode (https://code.visualstudio.com/docs/setup/linux)

### Non-GUI
- [ ] atuin
- [ ] p10k
- [ ] nvim
- [ ] git
- [ ] homebrew
- [ ] asdf
- [ ] tmux
- [ ] pyenv
- [ ] 1password cli
- [ ] brew install colima
- [ ] brew install qemu
- [ ] brew install docker-compose
- [ ] brew uninstall --cask docker --force
- [ ] brew uninstall --formula docker --force
- [ ] brew install --cask docker
- [ ] brew services start colima
- Docker desktop now includes the below two things
- [ ] Docker (https://docs.docker.com/engine/install/ubuntu/)
- [ ] Docker compose (https://docs.docker.com/compose/install/)
- B t use colima instead for now.
- [ ] AWS SDK (brew install awscli)
- [ ] SOPS (secure secret storage)
- [ ] Kubernetes (https://kubernetes.io/docs/tasks/tools/install-kubectl/)
    - [ ] brew install kubectl
    - [ ] Kubectx/Kubens
        ```
            sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
            sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
            sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
        ```
- [ ] fzf (https://github.com/junegunn/fzf)
- [ ] direnv
- [ ] postgres
- [ ] terraform
- [ ] [autojump](https://github.com/wting/autojump)
- [ ] migrate (https://github.com/golang-migrate/migrate/releases/tag/v4.14.1)
- [ ] cloud\_sql\_proxy (https://cloud.google.com/sql/docs/mysql/sql-proxy#install)
    - `cloud_sql_proxy -instances=platform-v2-project:europe-west1:customers-data-dev=tcp:5432`

## Logins

- [x] Slack
- [x] 1Password
- [x] Jira
- [ ] Sentry
- [ ] LastPass
- [ ] Dockerhub
- [ ] Git SSH key
    - [ ] Do this: https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/using-ssh-over-the-https-port
    ```
    # ~/.ssh/config
    Host github.com
      Hostname ssh.github.com
      Port 443
    ```
- [ ] Setup pypi pip repository (get password from 1pass)
    ```
    # ~/.pip/pip.conf
    [global]
    index-url = https://****:****@pypi.****.co.uk/simple/
    ```

## Configs

- [ ] nvim
	- `mkdir ~/.config/nvim`
	- `cp ~/dotfiles/nvim/init.vim ~/.config/nvim/`
- [ ] .bashrc
- [ ] .zshrc
- [ ] .tmuxrc

# Windows

- [ ] Docker desktop
- [ ] VS Code
- [ ] Ubuntu 20.04

