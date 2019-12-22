#!/bin/bash

#source credentials
source /root/keystonercv3-cvp &&
# create the file to be writen to
touch /tmp/stack_ids$(date +%F) /tmp/network_ids$(date +%F) /tmp/port_ids$(date +%F)


#display stacks which ids will run threw next for loop to get network ids
echo "stacks to have ports deleted"

openstack stack list | grep cvp | grep DELETE_FAILED;

openstack stack list | grep cvp | grep DELETE_FAILED | awk '{print $2}' >> /tmp/stack_ids$(date +%F) | sleep 2 &&

#populate file /tmp/network_ids* with network ids
for i in $(cat /tmp/stack_ids$(date +%F));
  do echo "stack id "$i;
     openstack resource list $i | grep "Neutron: :Net" | awk '{print $4}' >> /tmp/network_ids$(date +%F);
done |
sleep 2 &&

#populate file /tmp/port_ids* with port ids
for j in $(cat /tmp/network_ids$(date +%F));
  do echo "physical resource (network) id "$j;
     openstack port list -- network $j| grep Avi-Data | awk '{print $2}' >> /tmp/port_ids$(date +%F);
done &&

#display port ids that will be deleted
echo "avi ports to delete"
cat /tmp/port_ids$(date +%F);


#confirmation if yes delete ports selected from previous for loops
read -p "Are you sure?"  -r
if [[ $REPLY =~ ^[Yy]$ ]]
 then

   for k in $(cat /tmp/port_ids$(date +%F));
     do read -p echo "Avi port id"$k ;
        openstack port delete $k; done &&
   for k in $(cat /tmp/port_ids$(date +%F));
     do echo "Avi port id "$k ;
        openstack port delete $k; done

   echo "avi ports deleted";
   cat /tmp/port_ids$(date +%F);

   echo 'cleaning old files'
   rm /tmp/stack_ids* /tmp/network_ids* /tmp/port_ids*;

   echo "cleanup comepleted"
fi

#confirmation if no clean up files created eariler and stop script
 if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo "cleaning up files"
    rm /tmp/stack_ids* /tmp/network_ids* /tmp/port_ids*;
    echo "cleanup comepleted"
fi
