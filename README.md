# Taginfo for indoor=

Run a version of [taginfo][] dedicated to indoor features.

The osm data is filtered to only include features with a tag `level`.

## Usage

Edit the `.env` and update the `AREA` variable to match the area you want. `planet` download the whole planet. You can dowload extract from Geofabrik or others. See [download-osm](https://github.com/openmaptiles/openmaptiles-tools#multi-streamed-osm-data-downloader) to list available extracts.

To download, filter and create the database for taginfo, execute `./script/build.sh`.

To run the taginfo instance, `docker-compose up -d taginfo`, and go to http://localhost:4567

[taginfo]: https://github.com/taginfo/taginfo
