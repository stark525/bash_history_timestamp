require 'spec_helper'

describe file('/root/.bash_profile')  do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its (:content) { should contain("export HISTTIMEFORMAT='%F %T '") }
end

# Need to write a test that passes with stdout, but for some reason even something like this fails:
#describe command('history') do
#  its(:stdout) { should match /2015/ }
#end
