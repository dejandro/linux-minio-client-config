#!/bin/bash

#install the mc command line tool
if [[ ! -d "$HOME/minio-binaries/" ]] ; then
    curl https://dl.min.io/client/mc/release/linux-amd64/mc \
    --create-dirs \
    -o $HOME/minio-binaries/mc

    chmod +x $HOME/minio-binaries/mc
    echo "export PATH=\$PATH:\$HOME/minio-binaries/" >> .bashrc
    cd $HOME/minio-binaries/
else
    cd $HOME/minio-binaries/

#create the Alias for the minio instances
echo ""
while true; do
     read -p "Do you want to create new alias for the minio instance? [Y/n]" answer
     case $answer in
        [yY]* )  read -p "Enter the preferred name for the instance `echo $'\n> '`" instancename;
                 read -p "Enter your Access key for $instancename `echo $'\n> '`" accesskey;
                 read -p "Enter your Secret key for $instancename `echo $'\n> '`" secretkey;
                 read -p "Enter the http://IP-ADDRESS-OF-THE-INSTANCE:PORT for $instancename (e.g. http://12>
                 ./mc alias set $instancename $ipaddr $accesskey $secretkey;;
        [nN]* )  echo -e "\nSkipped"; break;;
        * ) echo -e "\nInvalid response";;
     esac
done
echo -e "\nTest and list buckets in $instancename\n"
./mc ls $instancename

cd $HOME/minio-binaries/
bash

fi
