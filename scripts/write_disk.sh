#!/bin/bash
`touch /tmp/yes_we_can`;
comando=`ls -la /tmp/yes_we_can | wc -l`;
if [[ $comando -lt 1 ]]
then
        echo "CRITICAL";
else
        echo "OK";
        `rm -f /tmp/yes_we_can`;
fi
