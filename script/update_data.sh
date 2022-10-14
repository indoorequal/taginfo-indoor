#!/bin/sh

set -ex

# Remove previous download
rm -f build/planet.osm.pbf
# download osm
docker-compose run --rm tools
# Extract data
docker-compose run --rm extractdata
# Restart taginfo web process
docker-compose restart web
