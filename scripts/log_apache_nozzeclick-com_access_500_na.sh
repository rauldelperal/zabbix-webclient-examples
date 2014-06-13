#!/bin/bash
#NOW=$(date +"%Y-%m-%d");
ruta_log="/var/log/apache2/nozzeclick.com-access.log";
ruta_file_history="/tmp/nozzeclick.com-access_log";
existe_his=`ls -l $ruta_file_history | wc -l  2>&1`;
existe_log=`ls -l $ruta_log | wc -l  2>&1`;
if [[ $existe_log -eq 1 ]]
then
if [[ $existe_his -eq 1 ]]
then
        number=`cat $ruta_file_history | awk -F"|" '{print $1}'`;
        if [[ $number -eq "" ]]
                then
                number=0
        fi
        size=`cat $ruta_file_history | awk -F"|" '{print $2}'`;
        size_log=`ls -la $ruta_log | awk '{print $5}'`;
        number_log=`sudo wc -l $ruta_log | awk '{print $1}'`;
        if [[ $number -gt $number_log ]]
        then
                resultado=`sudo tail -n $number_log $ruta_log | grep -e '" 50[0123] ' | wc -l`;
                echo $number_log\|$size_log > $ruta_file_history;
echo $resultado;

        elif [[ $number -eq $number_log  ]]
        then
                 echo "0";
        elif [[ $number -lt $number_log ]]
        then
                lineas_new=`expr $number_log - $number`;
                resultado=`sudo tail -n $lineas_new $ruta_log | grep -e '" 50[0123] ' | wc -l`;
                echo $resultado;
                echo $number_log\|$size_log > $ruta_file_history;
        fi

else
        size_log=`ls -la $ruta_log | awk '{print $5}'`;
        number_log=`sudo wc -l $ruta_log | awk '{print $1}'`;
        `touch /tmp/nozzeclick.com-access_log`;
        resultado=`sudo tail -n $number_log $ruta_log | grep -e '" 50[0123] ' | wc -l`;
        echo $number_log\|$size_log > $ruta_file_history;
        echo $resultado;
fi
else
        echo "-1";
fi

