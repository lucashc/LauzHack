#!/usr/bin/env

podman --remote run -it --rm --volume $(pwd):/var/www:Z -w /var/www -p 80:80 python python -m http.server 80