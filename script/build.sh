#!/bin/sh

set -ex

# Remove previous download
rm build/planet.osm.pbf
# download osm
docker-compose run --rm tools
# Extract data
docker-compose run --rm extractdata
