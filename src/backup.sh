#!/bin/bash
#
# backup.sh - A backup script using rsync to incrementally backup the
# user's home directory to an external drive "BACKUP".
#
# Copyright (C) 2017 Hoyt Harness, Positronikal
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# DEPENDENCIES: dialog

DIALOG=${DIALOG=dialog}

$DIALOG --title "SimpleBackup" --clear \
        --yesno "This utility uses rsync to backup your HOME directory to an external device labeled \"BACKUP\" that is expected to be mounted under the username in the /media directory. It ignores files in the same way CVS does. It runs in archive mode with verbose output and compression. Select YES to start or NO to abort." 15 61

case $? in
  0)
    rsync -Cavz ~ /media/$USER/BACKUP;;
  1)
    echo "Exiting...";;
  255)
    echo "Aborted!";;
esac
