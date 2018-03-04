set -e

# Install python
if [ ! -d "${HOME}/.pyenv/versions/2.7.14" ]
then
  echo -e "${BLUE}==>${NC} Installing python 2.7.14"
  pyenv install 2.7.14
fi

if [ ! -d "${HOME}/.pyenv/versions/3.6.4" ]
then
  echo -e "${BLUE}==>${NC} Installing python 3.6.4"
  pyenv install 3.6.4
fi

echo -e "${BLUE}==>${NC} Setting default python version to 3.6.4"
pyenv global 3.6.4

# Install virtualenv
if [ ! -f "/usr/local/bin/virtualenv" ]
then
  echo -e "${BLUE}==>${NC} Installing virtualenv"
  pip install virtualenv
fi
