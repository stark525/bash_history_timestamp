require 'spec_helper'

describe "Ensure HISTTIMEFORMAT in .bashprofile" do
	its (:content) { should contain("export HISTTIMEFORMAT='%F %R'") }
end
