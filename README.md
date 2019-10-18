# docker-reverseproxy

## Install

Clone the repository where you want. If you think you will add many sites to the reverse proxy, you can use the following command :

```bash
ln -s /your/cloned/repository/adduri /usr/local/bin/adduri
```

This way you will be able to call `adduri` from anywhere on your host.

## First start

Add your domain name to your DNS or hosts file, pointing to your own machine (like `127.0.0.1 local.mysite.docker`)

Run `startproxy` command with wanted options.

`/your/cloned/repository/startproxy -h` will give you a complete help but the command will probably look like

```bash
/your/cloned/repository/startproxy -d local.mysite.docker -n reverseproxy -p 8001 -m 8081
```

## Add a domain name

Add your domain name to your DNS or hosts file, pointing to your own machine (like `127.0.0.1 local.mysite2.docker`)

Then, use the `adduri` command to add it to your reverse proxy.

`adduri -h` will give you a complete help but the command will probably look like

```bash
adduri -d local.mysite2.docker -n reverseproxy -s 0 -p 8002 -m 8082
```

