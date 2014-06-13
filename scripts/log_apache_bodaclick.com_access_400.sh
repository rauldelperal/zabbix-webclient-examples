cat /var/log/apache2/bodaclick.com-access.log.1 | grep '" 404'  | perl /usr/bin/accesslog2csv.pl > /tmp/404.csv
