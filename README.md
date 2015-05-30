# bash_history_timestamp

If you have multiple users sudo'ing to root, it's helpful to add a timestamp to bash history.

This simple cookbook adds timestamp logging to root's `~/.bash_profile`

## Usage
You can configure the way the timestamp is formatted in the attributes file.  Default format is `'%F %R '` which will format like '2015-05-30 10:40'.

## Testing
You can add additional OS/boxes to .kitchen.yml and run `kitchen test`.  I have only tested this on CentOS 6.5.
