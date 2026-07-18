#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Deploying Attalis API..."
npm install
npm run build
pm2 restart attalis-api || pm2 start dist/index.js --name "attalis-api"
echo "Attalis API deployed successfully!"
