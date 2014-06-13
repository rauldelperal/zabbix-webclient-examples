#!/bin/bash
#!/bin/bash
resultado=`grep -e " 50[0123] " /var/log/apache2/*error.log |   grep 'PHP Fatal error'  /var/log/apache2/*error.log | wc -l `
echo $resultado;

