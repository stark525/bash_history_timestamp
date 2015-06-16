# bash_history_timestamp

If you have multiple users sudo'ing to root, it's helpful to add a timestamp to bash history.

This simple cookbook adds timestamp logging to root's `~/.bashrc`.  Note that this could also be modified and set to `~/.bash_profile`, but would fail Kitchen serverspec tests because when running the spec it does not actually create a login shell.  `man bash` for details.

## Usage
You can configure the way the timestamp is formatted in the attributes file.  Default format is `'%F %T '` which will format like 'YYYY-mm-dd hh:mm:ss '.

## Testing
You can add additional OS/boxes to .kitchen.yml and run `kitchen test`.  I have only tested this on CentOS 6.5.
