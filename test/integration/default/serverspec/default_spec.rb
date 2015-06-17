require 'spec_helper'

describe file('/root/.bashrc')  do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its (:content) { should contain("export HISTTIMEFORMAT='%F %T '") }
end

# Since history is a bash built-in,  command('history') fails.  We have to test in a slightly more complex way.
# http://stackoverflow.com/questions/9716849/commands-available-in-bash-i-cant-access-in-bash-l
# but this still doesn't work
describe command('sudo echo "history" | sudo bash -i 2> /dev/null') do
  its(:stdout) { should match /2015/  }
end
