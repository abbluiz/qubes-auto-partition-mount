#!/bin/bash

# Verify root
# TODO verify dmount/dunmount
# TODO Verify installation

# TODO detect if config is present; ask to override

echo '# QAM RC INSTALL (START) #' >> /rw/config/rc.local
echo 'qam-startup' >> /rw/config/rc.local
echo 'sudo -u user qubes-auto-mount' >> /rw/config/rc.local
echo '# QAM RC INSTALL (END) #' >> /rw/config/rc.local