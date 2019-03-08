#!/bin/bash

# Verify installation

# TODO Create shutdown/reboot script

sudo echo '#!/bin/bash' > /etc/init.d/qam-shutdown-reboot.sh
sudo chmod +x /etc/init.d/qam-shutdown-reboot.sh
sudo echo 'sudo -u user qubes-auto-unmount' >> /etc/init.d/qam-shutdown-reboot.sh

sudo ln -s /etc/init.d/qam-shutdown-reboot.sh /etc/rc0.d/000qam
sudo ln -s /etc/init.d/qam-shutdown-reboot.sh /etc/rc6.d/000qam