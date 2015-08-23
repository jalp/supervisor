#!/usr/bin/env bash
/opt/Prana/bin/Prana -c /etc/prana/prana.properties
echo 'Launching application...'
sudo supervisorctl start app