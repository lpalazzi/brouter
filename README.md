# BRouter

BRouter is a configurable OSM offline router with elevation awareness, Java +
Android. Designed to be multi-modal with a particular emphasis on bicycle
and energy-based car routing.

For more infos see [http://brouter.de/brouter](http://brouter.de/brouter).

## Install Dependencies

This project uses Gradle version 7.6, which supports Java up to version 19. If you have a newer version of Java you'll have to update the Gradle version in `/gradle/wrapper/gradle-wrapper.properties`.

### Ubuntu

Install the `javac` compiler:

```bash
apt-get install default-jdk
```

## Build and Run Server

```
# build the server
bash ./scripts/build.sh

# update the segment files to the most up-to-date for most of Canada (must have these downloaded to run the server)
bash ./scripts/update_segments.sh

# run the server on Linux
bash ./scripts/run.sh
```

To run the Brouter HTTP server on another platform, use the helper scripts provided in `misc/scripts/standalone`.

The API endpoints exposed by this HTTP server are documented in the
[`brouter-server/src/main/java/btools/server/request/ServerHandler.java`](brouter-server/src/main/java/btools/server/request/ServerHandler.java)
file.

E.g. HTTP request:

```
http://localhost:17777/brouter?lonlats=-83.014811,42.323696|-82.999228,42.291768&nogos=&profile=trekking&alternativeidx=0&format=geojson
```

### Build and run using Docker

A `Dockerfile` is included. Build the docker image using `docker build --tag brouter .` and start the container with `docker run -d -p 17777:17777 --name brouter brouter`.

## Segments (data) files

Routing data files are organised as 5\*5 degree files,
with the filename containing the south-west corner
of the square, which means:

- You want to route near West48/North37 -> you need `W50_N35.rd5`
- You want to route near East7/North47 -> you need `E5_N45.rd5`

These data files, called "segments" across BRouter, are generated from
[OpenStreetMap](https://www.openstreetmap.org/) data and stored in a custom
binary format (rd5) for improved efficiency of BRouter routing.

#### Download them from brouter.de

Segments files from the whole planet are generated weekly at
[https://brouter.de/brouter/segments4/](http://brouter.de/brouter/segments4/).

You can download one or more segments files, covering the area of the planet
you want to route, into the `misc/segments4` directory.

#### Generate your own segments files

You can also generate the segments files you need directly from a planet dump
of OpenStreetMap data (or a [GeoFabrik extract](https://download.geofabrik.de/)).

More documentation of this is available in the
[`misc/readmes/mapcreation.md`](misc/readmes/mapcreation.md) file.

### (Optional) Generate profile variants

This repository holds examples of BRouter profiles for many different
transportation modes. Most of these can be easily customized by setting
variables in the first `global` context of the profiles files.

An helper script is available in `misc/scripts/generate_profile_variants.sh`
to help you quickly generate variants based on the default profiles, to create
a default set of profiles covering most of the basic use cases.

Have a look at the
[`misc/readmes/profile_developers_guide.txt`](misc/readmes/profile_developers_guide.txt)
for an in-depth guide on profiles edition and customization.

## Documentation

More documentation is available in the [`misc/readmes`](misc/readmes) folder.

## License

BRouter is released under an [MIT License](LICENSE).
