# Setting up PC 

# Linux
## Install Programs
### GUI
- [x] Web Browser (Chrome)
    - [x] 1Password Extension
- [x] Slack (https://slack.com/intl/en-gb/downloads/instructions/ubuntu)
- [x] VSCode (https://code.visualstudio.com/docs/setup/linux)

### Non-GUI
- [x] p10k
- [x] nvim
- [x] git
- [x] homebrew
- [x] tmux
- Docker desktop now includes the below two things
- [x] Docker (https://docs.docker.com/engine/install/ubuntu/)
- [x] Docker compose (https://docs.docker.com/compose/install/)
- [ ] AWS SDK
- [x] Kubernetes (https://kubernetes.io/docs/tasks/tools/install-kubectl/)
    - [x] brew install kubectl
    - [x] Kubectx/Kubens
        ```
            sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
            sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
            sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
        ```
- [ ] fzf (https://github.com/junegunn/fzf)
- [ ] postgres
- [x] terraform
- [x] [autojump](https://github.com/wting/autojump)
- [ ] migrate (https://github.com/golang-migrate/migrate/releases/tag/v4.14.1)
- [ ] cloud\_sql\_proxy (https://cloud.google.com/sql/docs/mysql/sql-proxy#install)
    - `cloud_sql_proxy -instances=platform-v2-project:europe-west1:customers-data-dev=tcp:5432`

## Logins

- [x] Slack
- [x] 1Password
- [x] Jira
- [ ] Sentry
- [ ] LastPass
- [x] Git SSH key
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
- [x] .zshrc
- [x] .tmuxrc

# Windows

- [ ] Docker desktop
- [ ] VS Code
- [ ] Ubuntu 20.04

