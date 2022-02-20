SCRIPTSDIR=/docker/backup/scripts

if [ ! -d $BACKUPDIR ]; then
    mkdir -p $BACKUPDIR
fi

cd /docker/backup/scripts/

sudo wget https://raw.githubusercontent.com/kimostberg/dockerpi/master/backup/scripts/db-backup.sh

cd /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/kimostberg/dockerpi/master/backup/scripts/db-backup.service
sudo wget https://raw.githubusercontent.com/kimostberg/dockerpi/master/backup/scripts/db-backup.timer
sudo systemctl enable db-backup --now