#!/bin/bash
# Variables
BACKUP_DIR="/backups"
APACHE_CONF="/etc/httpd"
APACHE_ROOT="/var/www/html"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="$BACKUP_DIR/apache_backup_$DATE.tar.gz"

# Create the backup
tar -czf $BACKUP_FILE $APACHE_CONF $APACHE_ROOT

# Verify the backup
if tar -tzf $BACKUP_FILE &>/dev/null; then
    echo "Backup verification successful for $BACKUP_FILE" >> /backups/backup_verification.log
else
    echo "Backup verification FAILED for $BACKUP_FILE" >> /backups/backup_verification.log
fi
