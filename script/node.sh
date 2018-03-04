set -e

# Install node versions
if `! nvm ls | grep -q lts/argon`
then
  echo -e "${BLUE}==>${NC} Installing nodejs lts/argon"
  nvm install lts/argon --latest-npm
fi

if `! nvm ls | grep -q lts/boron`
then
  echo -e "${BLUE}==>${NC} Installing nodejs lts/boron"
  nvm install lts/boron --latest-npm
fi

if `! nvm ls | grep -q lts/carbon`
then
  echo -e "${BLUE}==>${NC} Installing nodejs lts/carbon"
  nvm install lts/carbon --latest-npm
fi

if `! nvm ls | grep -q stable`
then
  echo -e "${BLUE}==>${NC} Installing nodejs stable"
  nvm install stable --latest-npm
fi

echo -e "${BLUE}==>${NC} Setting default node version to stable"
nvm alias default stable
