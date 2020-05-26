# docker-reverseproxy

## Install

Clone the repository where you want. If you think you will add many sites to the reverse proxy, you can use the following command :

```bash
ln -s /your/cloned/repository/adduri /usr/local/bin/adduri
```

This way you will be able to call `adduri` from anywhere on your host.

## First start

Add your domain name to your DNS or hosts file, pointing to your own machine (like `127.0.0.1 local.mysite.docker`)

Build your docker with `SSL_ON` (1 or 0) and `HOST` (your docker host ip address) build-arg.

Run it with exposed port 80 and 443 if you need https. If you do, add /etc/certbot to the volumes. You should also give it a name.

e.g:
```bash
docker run -p 80:80 -p 443:443 -v /etc/certbot:/etc/certbot -d --name=reverseproxy reverseproxy:local`
```

## Add a domain name

Add your domain name to your DNS or hosts file, pointing to your own machine (like `127.0.0.1 local.mysite2.docker`)

Then, use the `adduri` command to add it to your reverse proxy.

`adduri -h` will give you a complete help but the command will probably look like

```bash
adduri -d local.mysite2.docker -n reverseproxy -s 0 -p 8002
```

