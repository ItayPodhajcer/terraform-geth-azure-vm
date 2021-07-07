#!/bin/bash
blkid --match-token TYPE=xfs ${nvme_device_name} || mkfs --type xfs -f ${nvme_device_name}
mkdir /home/${vm_user}/.ethereum
mount ${nvme_device_name} /home/${vm_user}/.ethereum
chown ${vm_user}:${vm_user} /home/${vm_user}/.ethereum
add-apt-repository -y ppa:ethereum/ethereum
apt-get update
apt-get install ethereum -y
echo "${nvme_device_name} ~/.ethereum xfs defaults,nofail 0 2" >> /etc/fstab
echo "${geth_service}" > /etc/systemd/system/geth.service
systemctl daemon-reload
systemctl enable geth.service
systemctl start geth.service