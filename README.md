# Pristine

Watches if any file managed by Puppet was modified.

# Workflow

  * Check if `puppet` is installed
  * Get list of file resources /var/lib/puppet/state

      filter out concats

  * Check if file or directory

      If directory, monitor recursevly

  * Create a inotify watcher to that list
  * When triggered, store timestamp, file name, PID and user

# TODO

Add `:accessed` to files that contain passwords

# Copyright

Copyright (C) 2016 Carla Souza <carlasouza.com>.

License GPLv3+: GNU GPL version 3 or later <gnu.org/licenses/gpl.html>. This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.
