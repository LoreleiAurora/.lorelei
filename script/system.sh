set -e

# Running system updates
echo -e "${BLUE}==>${NC} Running system updates"
softwareupdate -i -a
