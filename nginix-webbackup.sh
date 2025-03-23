#!/bin/bash
# Variables
BACKUP_DIR="/backups"
NGINX_CONF="/etc/nginx"
NGINX_ROOT="/usr/share/nginx/html"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="$BACKUP_DIR/nginx_backup_$DATE.tar.gz"

# Create the backup
tar -czf $BACKUP_FILE $NGINX_CONF $NGINX_ROOT

# Verify the backup
if tar -tzf $BACKUP_FILE &>/dev/null; then
    echo "Backup verification successful for $BACKUP_FILE" >> /backups/backup_verification.log
else
    echo "Backup verification FAILED for $BACKUP_FILE" >> /backups/backup_verification.log
fi
