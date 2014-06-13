#!/bin/bash
#NOW=$(date +"%Y-%m-%d")
ruta_log="/var/log/apache2/casamentoclick.com.br-access.log";
existe_log=`ls -l $ruta_log | wc -l  2>&1`;
if [[ $existe_log -eq 1 ]]
then
        resultado=`grep " 50[0,1,2,3] " $ruta_log | wc -l `;
        echo $resultado;
else
        echo "-1"
fi


