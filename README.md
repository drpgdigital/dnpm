# Docker NGINX Proxy Manager

This container is based on https://github.com/nginx-proxy/nginx-proxy

What this adds on top is a SSH server and some extra reading of the docker containers to allow you to connect to your MySQL, Redis...etc servers from the SSH container.

## Instructions

Run:
```
$ docker run -d -p 80:80 -p 2020:22 --net domains --name nginx-proxy --restart always -v /var/run/docker.sock:/tmp/docker.sock:ro boxednorman/nginx-proxy
```

To SSH into the container run:

```
$ ssh root@localhost -p2020
```

The password is: `root`.

Then using your preferred database manager you should be able to connect to the host of whatever you set the `VIRTUAL_HOST` environment variable to be.
