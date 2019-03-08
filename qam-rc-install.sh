#!/bin/bash

# TODO verify dmount/dunmount
# TODO Verify installation

# TODO detect if config is present; ask to override

sudo echo '# QAM RC INSTALL (START) #' >> /rw/config/rc.local
sudo echo 'qam-startup' >> /rw/config/rc.local
sudo echo 'sudo -u user qubes-auto-mount' >> /rw/config/rc.local
sudo echo '# QAM RC INSTALL (END) #' >> /rw/config/rc.local