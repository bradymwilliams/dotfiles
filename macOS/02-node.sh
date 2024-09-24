# install node and npm
volta install node

echo "installing a few global npm packages"

# npm-check-updates: check for outdated npm packages
# npkill: find and remove old and heavy node_modules folders
# fkill-cli: find and kill processes by name
npm install --global npm-check-updates npkill fkill-cli
