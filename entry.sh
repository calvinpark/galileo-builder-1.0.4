#!/bin/bash -e
NUMCPU=$(nproc)
NUMTHREADS=$(expr ${NUMCPU} \* 2)
sed -i s/12/${NUMTHREADS}/g /tmp/Galileo-Runtime-1.0.4/meta-clanton_v1.0.1/yocto_build/conf/local.conf
sed -i s/14/${NUMTHREADS}/g /tmp/Galileo-Runtime-1.0.4/meta-clanton_v1.0.1/yocto_build/conf/local.conf

red='\033[0;31m'
NC='\033[0m' # No Color
clear
echo -e "${red}Welcome to Galileo Builder 1.0.4!${NC}" 
echo -e "${red}Run this container like this: docker run -it calvinpark/galileo-builder-1.0.4${NC}" 
echo -e "Please read README.txt and follow from section 4.3: cd meta-clanton_v1.0.1"
echo -e "Section 1 through 4.2 were all done by the container."
echo -e "${red}Have fun!${NC}"

bash --login