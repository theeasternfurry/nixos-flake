# Dump blossomgarden
sudo -u postgres pg_dump blossomgarden > ~/blossomgarden_$(date +%Y%m%d_%H%M%S).sql
gzip ~/blossomgarden_*.sql

# Dump blossomgarden-trading
sudo -u postgres pg_dump blossomgarden-trading > ~/blossomgarden-trading_$(date +%Y%m%d_%H%M%S).sql
gzip ~/blossomgarden-trading_*.sql

# Upload
rclone copy ~/blossomgarden_*.sql.gz gdrive:Backup-Server/PostgreSQL -P
rclone copy ~/blossomgarden-trading_*.sql.gz gdrive:Backup-Server/PostgreSQL -P

# Remove backup files
rm -rf ~/*.sql.gz
