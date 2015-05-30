require 'spec_helper'

describe file('/root/.bash_profile')  do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its (:content) { should contain("export HISTTIMEFORMAT='%F %R '") }
end

#   test if ~/.bash_history returns a date?
#   ^/[0-9]{4}-[0-9]{2}-[0-9]{2}$/
