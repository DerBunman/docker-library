#!/usr/bin/env sh

cat <<EOF
 ____ _____  _    ____ _____ ___ _   _  ____
/ ___|_   _|/ \  |  _ \_   _|_ _| \ | |/ ___|
\___ \ | | / _ \ | |_) || |  | ||  \| | |  _
 ___) || |/ ___ \|  _ < | |  | || |\  | |_| |
|____/ |_/_/   \_\_| \_\|_| |___|_| \_|\____|

APACHE_RUN_USER  = $APACHE_RUN_USER
APACHE_RUN_GROUP = $APACHE_RUN_GROUP
EOF

mkdir -p /var/log/apache2 /var/www
chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP /var/log/apache2/ /var/www
chmod g+s /var/log/apache2/ /var/www

/usr/sbin/apachectl -D FOREGROUND
