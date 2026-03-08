# Dump blossomgarden
sudo -u postgres pg_dump blossomgarden > ~/blossomgarden_$(date +%Y%m%d_%H%M%S).sql
gzip ~/blossomgarden_*.sql

# Dump blossomgarden-trading
sudo -u postgres pg_dump blossomgarden-trading > ~/blossomgarden-trading_$(date +%Y%m%d_%H%M%S).sql
gzip ~/blossomgarden-trading_*.sql

# Dump jam_company
sudo -u postgres pg_dump jam_company > ~/jam_company_$(date +%Y%m%d_%H%M%S).sql
gzip ~/jam_company_*.sql

# Upload
rclone copy ~/blossomgarden_*.sql.gz gdrive:Backup-Server/PostgreSQL -P
rclone copy ~/blossomgarden-trading_*.sql.gz gdrive:Backup-Server/PostgreSQL -P
rclone copy ~/jam_company_*.sql.gz gdrive:Backup-Server/PostgreSQL -P

# Remove backup files
rm -rf ~/*.sql.gz

# Backup RustFS
sudo tar -czf ~/rustfs_backup_$(date +%Y%m%d_%H%M%S).tar.gz /var/lib/rustfs
rclone copy ~/rustfs_*.tar.gz gdrive:Backup-Server/RustFS/ -P
rm -f ~/rustfs_*.tar.gz

# Backup Veloren
sudo tar -czf ~/veloren_backup_$(date +%Y%m%d_%H%M%S).tar.gz /var/lib/veloren
rclone copy ~/veloren_*.tar.gz gdrive:Backup-Server/Veloren/ -P
rm -f ~/veloren_*.tar.gz

# Backup RustFS
sudo tar -czf ~/jam-company_backup_$(date +%Y%m%d_%H%M%S).tar.gz /var/lib/jam-company
rclone copy ~/jam-company_*.tar.gz gdrive:Backup-Server/JamCompany/ -P
rm -f ~/jam-company_*.tar.gz
