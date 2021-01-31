#!/bin/bash

if [[ $1 == "" ]];then
	echo -e "
\033[0;31mzonetransfer.sh 'host'\033[1;37m
";exit
fi

host -t ns $1|cut -d " " -f4|sed s/.$// > ns

echo -e "
\033[0;31mName Servers\033[1;37m
";cat ns
echo -e "
\033[0;31mTentando Transferencia de Zona\033[1;37m
"

for quant in $(cat ns);do
	host -a -l $1 $quant
done
echo -e "
\033[0;31m------------------------------------------------\033[1;37m
";rm -f ns


