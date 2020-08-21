#!/bin/bash
# date to create 21.08.2020 
echo "Start"
echo "Add group admin"
groupadd admin
echo " Add user IS"
echo "%admin ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers.d/admin
adduser is -c "Ihor Skripnichenko" -d /home/is -G admin -p "$(python -c 'import crypt; print(crypt.crypt("YOUR SECRET", crypt.mksalt(crypt.METHOD_SHA512)))')"
echo "End"
cat /etc/passwd | grep is
cat /etc/group | grep admin
sudo -l -U is
