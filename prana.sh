#!/usr/bin/env bash
/opt/Prana/bin/Prana -c /etc/prana/prana.properties &
sleep 60
echo 'Launching application...'
supervisorctl start app