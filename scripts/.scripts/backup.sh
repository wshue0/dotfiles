#!/usr/bin/env bash
notify-send "Mounting Backup Drive"

if [[ $(lsblk) =~ "sda" ]]
then 
  sudo mount /dev/sda1 /mnt/kingston
  notify-send "Mounted Drive: Starting Backup"
  sudo backintime backup
  sudo umount /dev/sda1
  notify-send "Finished Backup: Remove Drive"
else
  notify-send "Drive could not be mounted"
fi



