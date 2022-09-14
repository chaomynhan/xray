#!/bin/sh
systemctl enable --now docker
docker rm -f fast4g
docker rm -f skypn
docker rm -f nginx
docker run -d --restart=unless-stopped -p 0.0.0.0:1080:80 -v $(pwd)/fast4g.yml:/etc/XrayR/config.yml --name fast4g misakano7545/xrayr
docker run -d --restart=unless-stopped -p 0.0.0.0:2080:80 -v $(pwd)/skypn.yml:/etc/XrayR/config.yml --name skypn misakano7545/xrayr
docker run -d --restart=unless-stopped -p 80:80 -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf --name nginx nginx
echo "Deploy hoan thanh."
