#!/bin/bash

if ([ $1 = "--init" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dev" ]); then

    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red
    sudo npm install
    sudo npm run build
    #npm start
    sudo cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/install-files-local/settings-localhost.js

fi

if ([ $1 = "--refresh" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dev" ]); then
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/install-files-local/settings-localhost.js

fi

if ([ $1 = "--init" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dosrv02" ]); then

    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red
    sudo npm install
    sudo npm run build
    #npm start
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/install-files-local/settings-all-digitalocean.js

fi

if ([ $1 = "--refresh" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dosrv02" ]); then
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/install-files-local/settings-all-digitalocean.js

fi



if ([ $1 = "--init" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "cloud41" ]); then

    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red
    sudo npm install
    sudo npm run build
    #npm start
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/install-files-local/settings-cloud41.js

fi

if ([ $1 = "--refresh" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "cloud41" ]); then
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/install-files-local/settings-cloud41.js

fi

if ([ $1 = "" ] || [ $2 = false ] || [ $3 = "" ] || [ $4 = false ]); then
    echo 'Please define the attributes --init true or --refresh true'
    exit 1
fi
