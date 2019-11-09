#!/bin/bash

echo "start script running..."

if ([ $1 = "--init" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dev" ]); then

    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red
    sudo npm install
    sudo npm run build
    #npm start
    sudo cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/client-installation/settings-localhost.js gofairflows_.local.json

fi

if ([ $1 = "--refresh" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dev" ]); then
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/client-installation/settings-localhost.js gofairflows_.local.json

fi

if ([ $1 = "--init" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dosrv02" ]); then

    echo "--init --env: dosrv02 loading..."
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red
    sudo npm install
    sudo npm run build
    #npm start
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/client-installation/settings-all-digitalocean.js gofairflows_.dosrv02.json
    echo "--init --env: dosrv02 loaded!"
fi

if ([ $1 = "--refresh" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dosrv02" ]); then
    echo "--refresh --env: dosrv02 loading..."
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/client-installation/settings-all-digitalocean.js gofairflows_.dosrv02.json
    echo "--refresh --env: dosrv02 loaded!"
fi



if ([ $1 = "--init" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "cloud41" ]); then

    echo "--init --env: cloud41 loading..."
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red
    sudo npm install
    sudo npm run build
    #npm start
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/client-installation/settings-cloud41.js /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/client-installation/gofairflows_.cloud41.json
    echo "--init --env: cloud41 loaded!"
fi

if ([ $1 = "--refresh" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "cloud41" ]); then
    echo "--refresh --env: cloud41 loading..."
    cd /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/packages/node_modules/node-red
    sudo node red.js -s /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/client-installation/settings-cloud41.js /Users/jbjares/workspaces/PHTWorkspace/central_workspace/train4fair/node-red/client-installation/gofairflows_.cloud41.json
    echo "--refresh --env: cloud41 loaded!"
fi

if ([ $1 = "" ] || [ $2 = false ] || [ $3 = "" ] || [ $4 = false ]); then
    echo 'Please define the attributes --init true or --refresh true'
    exit 1
fi

echo "start script finished!"