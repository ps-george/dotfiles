# Setting up PC 

# Linux
## Install Programs
### GUI
- [ ] Web Browser (Chrome)
    - [ ] LastPass Extension
    - [ ] 1Password Extension
- [ ] Slack (https://slack.com/intl/en-gb/downloads/instructions/ubuntu)
- [ ] VSCode (https://code.visualstudio.com/docs/setup/linux)

### Non-GUI
- [ ] nvim
- [ ] git
- [ ] tmux
- [ ] Docker (https://docs.docker.com/engine/install/ubuntu/)
- [ ] Docker compose (https://docs.docker.com/compose/install/)
- [ ] Google Cloud SDK (https://cloud.google.com/sdk/docs/install#deb)
    - `gcloud auth configure-docker`
    - `gcloud auth login`
- [ ] Kubernetes (https://kubernetes.io/docs/tasks/tools/install-kubectl/)
    - [ ] Kubectx/Kubens
        ```
            sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
            sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
            sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
        ```
    - https://app.gitbook.com/@wayhome-2/s/developers/infrastructure/kubernetes
- [ ] fzf (https://github.com/junegunn/fzf)
- [ ] cloud\_sql\_proxy (https://cloud.google.com/sql/docs/mysql/sql-proxy#install)
    - `cloud_sql_proxy -instances=platform-v2-project:europe-west1:customers-data-dev=tcp:5432`
- [ ] migrate (https://github.com/golang-migrate/migrate/releases/tag/v4.14.1)
- [ ] postgres
- [ ] terraform

## Logins

- [ ] Slack
- [ ] 1Password
- [ ] LastPass
- [ ] Git SSH key
    - Do this: https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/using-ssh-over-the-https-port
    ```
    # ~/.ssh/config
    Host github.com
      Hostname ssh.github.com
      Port 443
    ```
- [ ] Setup wayhome pip repository (get password from 1pass)
    ```
    # ~/.pip/pip.conf
    [global]
    index-url = https://****:****@pypi.futurewayhome.co.uk/simple/
    ```

## Configs

- [ ] nvim
	- `mkdir ~/.config/nvim`
	- `cp ~/dotfiles/nvim/init.vim ~/.config/nvim/`
- [ ] .bashrc
- [ ] .tmuxrc

# Windows

- [ ] Docker desktop
- [ ] VS Code
- [ ] Ubuntu 20.04

