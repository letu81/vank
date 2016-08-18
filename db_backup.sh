current_date=`date +%Y-%m-%d:%H:%M:%S`
mysqldump -h localhost -uroot -pxxx jam_production >/dev/db_backup/jam_shop/shop_"$current_date".sql
