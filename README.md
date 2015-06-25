# bash_history_timestamp

If you have multiple users sudo'ing to root, it's helpful to add a timestamp to bash history.

This simple cookbook adds timestamp logging to root's `~/.bashrc`.

## Usage
You can configure the way the timestamp is formatted in the attributes file.  Default format is `'%F %T '` which will format like 'YYYY-mm-dd hh:mm:ss '.

## Attributes
Configure formatting of history output. `man histtimeformat` for more info.
`['bash_history_timestamp']['flags'] = '%F %T '`

Full path to bash file, typically .bashrc or .bash_profile
`default['bash_history_timestamp']['bash_file'] = '/root/.bashrc'`

## Testing
There are kitchen tests associated with CentOS 6.5.  

I've manually tested and verified this cookbook with other Linux distros, but YMMV using `kitchen test`.

Serverspec tests may fail because when running the spec it does not actually create a login shell.  `man bash` for details. 
