#/bin/bash

if ! grep -q "dockerhost" "/etc/hosts"; then
	echo "${HOST}	dockerhost" >> /etc/hosts
fi

#nginx -g "daemon off;";
exec "$@"
