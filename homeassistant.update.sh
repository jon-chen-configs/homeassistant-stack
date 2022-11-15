#!/bin/sh

echo "Updating home assistant to latest image"
# ha_update_status=$(sudo docker pull homeassistant/home-assistant:stable | grep 'Image is up to date')
# if [[ !($ha_update_status) ]]
# then
    echo "make backup of existing config"
    cp -r /volume4/docker/swarm/conf/homeassistant-stack/homeassistant/config /volume4/docker/swarm/conf/homeassistant-stack/homeassistant/config-`date +%Y%m%d`

    echo "Copy Alexa component from git to instance"
    cd /volume4/docker/swarm/data/homeassistant-stack/src/home-assistant
    git fetch upstream
    git switch master
    git merge upstream/master
    git switch alexa-synonym-ids
    git merge -m "upgrade to new HA version" master
    git push origin --all

    rm -rf /volume4/docker/swarm/conf/homeassistant-stack/homeassistant/config/custom_components/alexa/*
    cp homeassistant/components/alexa/* /volume4/docker/swarm/conf/homeassistant-stack/homeassistant/config/custom_components/alexa
    sed -i '2 i  \ \ "version": "0.0.1",' /volume4/docker/swarm/conf/homeassistant-stack/homeassistant/config/custom_components/alexa/manifest.json
# else
#     echo "image up-to-date"
# fi

/volume4/docker/swarm/conf/homeassistant-stack/homeassistant.deploy.sh