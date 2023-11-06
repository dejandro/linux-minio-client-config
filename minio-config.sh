#!/bin/bash

#install the mc command line tool
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/minio-binaries/mc

chmod +x $HOME/minio-binaries/mc
echo "export PATH=\$PATH:\$HOME/minio-binaries/" >> .bashrc
cd $HOME/minio-binaries/

#create the Alias for the minio instances
echo ""
while true; do
     read -p "Do you want to create a new alias for the minio instance? [Y/n]" answer
     case $answer in
        [yY]* )  read -p "Enter the preferred name for the instance `echo $'\n> '`" instancename;
                 read -p "Enter your Access key for $instancename `echo $'\n> '`" accesskey;
                 read -p "Enter your Secret key for $instancename `echo $'\n> '`" secretkey;
                 read -p "Enter the http://IP-ADDRESS-OF-THE-INSTANCE:PORT for $instancename (e.g. http://127.0.0.1:9000) `echo $'\n> '`" ipaddr;
                 ./mc alias set $instancename $ipaddr $accesskey $secretkey;;
        [nN]* )  echo -e "\nSkipped"; break;;
        * ) echo -e "\nInvalid response";;
     esac
done
echo -e "\nTest and list buckets in $instancename\n"
./mc ls $instancename

cd $HOME/minio-binaries/
bash
