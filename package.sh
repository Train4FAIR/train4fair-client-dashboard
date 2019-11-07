#!/bin/bash


PROPERTY_FILE=private.properties

function getProperty {
   PROP_KEY=$1
   PROP_VALUE=`cat $PROPERTY_FILE | grep "$PROP_KEY" | cut -d'=' -f2`
   echo $PROP_VALUE
}

echo "# Reading property from $PROPERTY_FILE"
MENZEL_USER=$(getProperty "menzel.user")
MENZEL_PASS=$(getProperty "menzel.pass")
MENZEL_URL=$(getProperty "menzel.url")
CLOUD41_USER=$(getProperty "cloud41.user")
CLOUD41_PASS=$(getProperty "cloud41.pass")
CLOUD41_URL=$(getProperty "cloud41.url")
DAV_DOC_USERNAME=$(getProperty "dav.doc.username")
DAV_DOC_PASSWD=$(getProperty "dav.doc.passwd")
DAV_DOC_URL=$(getProperty "dav.doc.url")
DAV_DOC_INSTALL_CONTENT_NAME=$(getProperty "dav.doc.installation.content.name")
SETUP_MODE_INIT=$(getProperty "setup.mode.init")
SETUP_MODE_INIT_VALUE=$(getProperty "setup.mode.init.value")
SETUP_MODE_ENV=$(getProperty "setup.mode.env")
SETUP_MODE_ENV_VALUE=$(getProperty "setup.mode.env.value")
SETUP_MODE_INIT_DAV=$(getProperty "setup.mode.init.dav")
SETUP_MODE_INIT_DAV_VALUE=$(getProperty "setup.mode.init.dav.value")
DIG_OCEAN_DAV_HOST=$(getProperty "digital.ocean.dav.host")
DIG_OCEAN_DAV_USER=$(getProperty "digital.ocean.dav.user")
DIG_OCEAN_DAV_PASS=$(getProperty "digital.ocean.dav.pass")

if ([ $1 = "--init" ] && [ $2 = true ]); then
	
	echo "Process Started!"
	sudo tar -zcvf client-installation.tar.gz client-installation/
	
	echo "Copying files to cloud "$DIG_OCEAN_DAV_HOST:/webdav/documentation/data/installation/client
	echo "Please wait..."
	sudo sshpass -p $DIG_OCEAN_DAV_PASS scp client-installation.tar.gz $DIG_OCEAN_DAV_USER@$DIG_OCEAN_DAV_HOST:/webdav/documentation/data/installation/client/
	#scp ~/workspaces/inbraMarketingCode/venv/pub/Train4FAIR_logo1.png root@167.172.175.112:/webdav/documentation/data/media/static/files/img/
	sudo rm client-installation.tar.gz
	
	echo "Process Finished!"
fi



