#!/bin/bash
#NOW=$(date +"%Y-%m-%d")
ruta_log="/var/log/apache2/bdk_accounts_ssl-access.log";
existe_log=`ls -l $ruta_log | wc -l  2>&1`;
if [[ $existe_log -eq 1 ]]
then
	resultado=`grep " 500 " $ruta_log | wc -l `;
	echo $resultado;
else
	echo "-1"
fi
