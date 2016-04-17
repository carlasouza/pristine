# Don't touch it

Watches if any file managed by Puppet was modified.

# Workflow

  * Check if `puppet` is installed
  * dont-touch-it# Get list of file resources /var/lib/puppet/state
      filer out concats
  * Check if file or directory
      If directory, monitor recursevly
  * Create a inotify watcher to that list
  * When triggered, store timestamp, file name, PID and user

# TODO

Add `:accessed` to files that contain passwords
