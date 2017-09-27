#! /bin/bash
ssh root@10.111.6.5 <<'ENDSSH'
cd ~/fyoga
git pull origin master
docker-compose build
docker-compose restart
exit
ENDSSH

