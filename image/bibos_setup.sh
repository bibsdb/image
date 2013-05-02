#!/usr/bin/env bash

# Setup the configuration we know to be necessary for this 
# computer to be "BibOS ready".

# Will execute the following steps:
# * Overwrite file structure
# * Install packages
# * Create and setup user "user"
#
# The machine will now be a fully functional and standardized 
# BibOS computer which is not, however, registered with the admin 
# system nor endowed with local settings such as printers, etc.
#
# After running this script on a fresh Ubuntu install, you can
# customize it to your heart's content - change the wallpaper of the default
# user, add scripts, whatever. Once you're done customizing, please call the
# *finalize* script to launch the setup script on first boot.
# When this is done, the image can be cloned and packed with Clonezilla
# and/or be made available for Clonezilla network installation.

# Fix permission problem to avoid irritating warning.
sudo chmod 0440 /etc/sudoers.d/bibos
DIR=$(dirname ${BASH_SOURCE[0]})

# Overwrite file tree.
sudo "$DIR/do_overwrite.sh"

# Install all necessary packages and dependencies
/usr/local/bin/install_dependencies.sh

# Setup default user
sudo useradd user -m -p 12345 -U
sudo adduser user nopasswdlogin



