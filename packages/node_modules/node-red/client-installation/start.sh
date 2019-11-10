#!/bin/bash

if ([ $1 = "--init" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dev" ]); then

    cd app/train-modelling-tool-gofair/
    npm install
    npm run build

    cd packages/node_modules/node-red
    sudo node red.js -s /app/settings-localhost.js

fi

if ([ $1 = "--refresh" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "dev" ]); then
    cd app/train-modelling-tool-gofair/
    cd packages/node_modules/node-red/
    node red.js -s /app/settings-localhost.js

fi


if ([ $1 = "--init" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "cloud41" ]); then

    cd app/train-modelling-tool-gofair/
    npm install
    npm run build

    cd packages/node_modules/node-red
    node red.js -s /app/settings-cloud41.js
fi

if ([ $1 = "--refresh" ] && [ $2 = true ] && [ $3 = "--env" ] && [ $4 = "cloud41" ]); then
    cd app/train-modelling-tool-gofair/
    cd packages/node_modules/node-red/
    node red.js -s /app/settings-cloud41.js
fi

if ([ $1 = "" ] || [ $2 = false ] || [ $3 = "" ] || [ $4 = false ]); then
    echo 'Please define the attributes --init true or --refresh true'
    exit 1
fi
