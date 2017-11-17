#! /bin/bash
ssh root@101.132.158.123 <<'ENDSSH'
cd ~/fyoga
git pull origin master
cp -f fyoga-production /etc/logrotate.d/fyoga-production
docker-compose up --build
exit
ENDSSH

