# Pristine

Watches if any file managed by Puppet was modified.

# Usage

```
$ ./bin/pristine -h
Usage: pristine [options]
        --config FILE                Config file
    -l, --log FILE                   Log output
    -f, --files                      Files list to watch
    -h, --help                       Show this message
        --version                    Show version
```

# Example


```
$ git clone https://github.com/carlasouza/pristine.git; cd pristine
$ ./example/create_example_files.sh
$ ./bin/pristine -c config.yaml
W, [2016-04-17T19:18:34.376080 #29074]  WARN -- : /foo/bar does not exist.
I, [2016-04-17T19:18:34.376153 #29074]  INFO -- : /tmp/pristine/example/ watcher created.
I, [2016-04-17T19:18:34.376190 #29074]  INFO -- : /tmp/pristine/example/a watcher created.
I, [2016-04-17T19:18:34.376226 #29074]  INFO -- : /tmp/pristine/example/a/c watcher created.
I, [2016-04-17T19:18:34.376260 #29074]  INFO -- : /tmp/pristine/example/a/d watcher created.
I, [2016-04-17T19:18:34.376292 #29074]  INFO -- : /tmp/pristine/example/b watcher created.
```

Modify file /tmp/pristine/example/a/c

```
I, [2016-04-17T19:19:28.959390 #29074]  INFO -- : /tmp/pristine/example/a/c - [:modify]
```


# TODO

  * Arguments sanity check

  * Check if `puppet` is installed

  * Filter out concats from resources file

  * Check if file or directory

      If directory, monitor recursevly

  * Add `:access` to files that contain passwords

  * Add a watcher to the `file_list` file and then reload itself upon modification



# Copyright

Copyright (C) 2016 Carla Souza <carlasouza.com>.

License GPLv3+: GNU GPL version 3 or later <gnu.org/licenses/gpl.html>. This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.
