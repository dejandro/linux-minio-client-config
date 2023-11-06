#!/bin/bash

#install the mc command line tool
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/minio-binaries/mc

chmod +x $HOME/minio-binaries/mc
echo "export PATH=\$PATH:\$HOME/minio-binaries/" >> .bashrc
cd $HOME/minio-binaries/

#create the Alias for the FIRST and SECOND minio instances
echo ""
while true; do
     read -p "Do you want to create an Alias for the FIRST minio instance? [Y/n]" firstinput
     case $firstinput in
        [yY]* )  read -p "Enter your Access key for FIRST `echo $'\n> '`" accessfirst;
                 read -p "Enter your Secret key for FIRST `echo $'\n> '`" secretfirst;
                 ./mc alias set FIRST http://IP-ADDRESS-OF-THE-FIRST-INSTANCE:PORT $accessfirst $secretfirst; break;;
        [nN]* )  echo -e "\nSkipped"; break;;
        * ) echo -e "\nInvalid response";;
     esac
done
echo ""
while true; do
     read -p "Do you want to create an Alias for the SECOND minio instance? [Y/n]" secondinput
     case $secondinput in
        [yY]* )  read -p "Enter your Access key for SECOND `echo $'\n> '`" accesssecond;
                 read -p "Enter your Secret key for SECOND `echo $'\n> '`" secretsecond;
                 ./mc alias set SECOND http://IP-ADDRESS-OF-THE-SECOND-INSTANCE:PORT $accesssecond $secretsecond; break;;
        [nN]* )  echo -e "\nSkipped"; break;;
        * ) echo -e "\nInvalid response";;
     esac
done

echo -e "\nTest and list buckets in FIRST\n"
./mc ls FIRST

cd $HOME/minio-binaries/
bash
