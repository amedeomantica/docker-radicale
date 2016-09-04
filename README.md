#docker-radicale (CalDav/CardDav Server)
[![](https://images.microbadger.com/badges/image/rdissertori/docker-radicale.svg)](http://microbadger.com/images/rdissertori/docker-radicale)

docker files for radicale CalDav/CardDav server

#Configuration
Make sure you download the config, passwd, rights file and modify this to your needs.
and put them to the volume directory (see below)

#Starting radicale
docker run --name radicale -p 5232:5232 -v [path_to_downloaded_configs]:/data/radicale -d radicale rdissertori/docker-radicale

#Dav Client
For Android you can download a very powerful client that can also sync contacts (import/export)

1) OpenTasks before you start DavDroid

2) DavDroid