SCRIPTSDIR=/docker/backup/scripts

if [ ! -d $SCRIPTSDIR ]; then
    mkdir -p $SCRIPTSDIR
fi

if [ ! -f /docker/backup/scripts/db-backup.sh ]; then
    sudo wget https://raw.githubusercontent.com/kimostberg/dockerpi/master/backup/scripts/db-backup.sh -P /docker/backup/scripts
fi

sudo sh /docker/backup/scripts/db-backup.sh

if [ ! -f /etc/systemd/system/db-backup.service ]; then
    sudo wget https://raw.githubusercontent.com/kimostberg/dockerpi/master/backup/scripts/db-backup.service -P /etc/systemd/system
fi

if [ ! -f /etc/systemd/system/db-backup.timer ]; then
    sudo wget https://raw.githubusercontent.com/kimostberg/dockerpi/master/backup/scripts/db-backup.timer -P /etc/systemd/system
fi

sudo systemctl enable db-backup --now