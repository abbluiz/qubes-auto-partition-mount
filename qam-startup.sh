#!/bin/bash

# Verify root
# Verify installation

# TODO Create shutdown/reboot script

echo '#!/bin/bash' > /etc/init.d/qam-shutdown-reboot.sh
chmod +x /etc/init.d/qam-shutdown-reboot.sh
echo 'sudo -u user qubes-auto-unmount' >> /etc/init.d/qam-shutdown-reboot.sh

ln -s /etc/init.d/qam-shutdown-reboot.sh /etc/rc0.d/000qam
ln -s /etc/init.d/qam-shutdown-reboot.sh /etc/rc6.d/000qam