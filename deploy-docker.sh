#! /bin/bash
ssh root@111.231.69.22 <<'ENDSSH'
cd ~/fyoga
git pull origin master
docker-compose build
docker-compose restart
exit
ENDSSH

