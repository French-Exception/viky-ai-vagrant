#!/usr/bin/env bash
set -x

ruby_version=${ruby_version:="2.6.5"}
nodejs_version=${nodejs_version:="10.17.0"}

apt_proxy=$(cat /vagrant/.vm_$(hostname)_apt_proxy)

if [[ ! -z "$apt_proxy" ]]; then
  echo "Acquire::http::Proxy \"$apt_proxy\";" | sudo tee /etc/apt/apt.conf.d/proxy.conf
  echo 'Acquire::https::Proxy "DIRECT";' | sudo tee -a /etc/apt/apt.conf.d/proxy.conf
fi

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive \
  apt-get \
  -o Dpkg::Options::=--force-confold \
  -o Dpkg::Options::=--force-confdef \
  -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
  full-upgrade

sudo apt-get install -y git-core apt-transport-https ca-certificates curl gnupg2 software-properties-common \
                        graphviz imagemagick postgresql-client \
                        libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev \
                        libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev

echo "export PATH=\"\$HOME/.rbenv/bin:\$HOME/.rbenv/shims:\$PATH\"" >> ~/.bashrc
export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH

curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

rbenv init
rbenv install $ruby_version
rbenv local $ruby_version
rbenv global $ruby_version
echo $ruby_version > $HOME/viky-ai/.ruby-version
eval "$(rbenv init -)"

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker vagrant
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" \
              -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install v${nodejs_version}
npm i -g yarn

