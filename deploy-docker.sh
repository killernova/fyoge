#! /bin/bash
ssh root@101.132.158.123 <<'ENDSSH'
cd ~/fyoga
git pull origin master
docker-compose build
docker-compose restart
exit
ENDSSH

