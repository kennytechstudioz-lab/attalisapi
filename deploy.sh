#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Deploying Delta API..."
npm install
npm run build
pm2 restart delta-api || pm2 start dist/index.js --name "delta-api"
echo "Delta API deployed successfully!"
