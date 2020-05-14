#!/bin/bash

USER=`whoami`
SRCDIR="/home/$USER/Documents/my_work/"
DESTDIR="/home/$USER/Backups/"

if [ -d "$SRCDIR" ] && [ -d $DESTDIR ]; then
	echo "Backup iniciado"
	FILENAME=ug-$(date +%-Y%-m%-d)-$(date +%-T).tgz
	sleep 15000
	tar --create --gzip --file=$DESTDIR$FILENAME $SRCDIR
	echo "Backup finalizado"
else
	echo "No se puede ejecutar el backup"
fi