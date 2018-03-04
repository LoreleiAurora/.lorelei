set -e

# Install ruby
if [ ! -d "${HOME}/.rbenv/versions/2.5.0" ]
then
  echo -e "${BLUE}==>${NC} Installing ruby 2.5.0"
  rbenv install 2.5.0
fi

echo -e "${BLUE}==>${NC} Setting default ruby version to 2.5.0"
rbenv global 2.5.0
gem install bundler
