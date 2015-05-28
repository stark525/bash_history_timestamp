#
# Cookbook Name:: bash_history_timestamp
# Recipe:: default
#
# Copyright (c) 2015 Dan Stark <dstark75@gmail.com>, All Rights Reserved.

directory '/root/.ssh' do
  action :create
end

file '/root/.ssh/.bash_profile' do
  action :create_if_missing	
end

replace_or_add "HISTTIMEFORMAT to bash_profile" do
  path "/root/.ssh/.bash_profile"
  pattern "export HISTTIMEFORMAT*"
  line "export HISTTIMEFORMAT='#{node['bash_history_timestamp']['flags']}'"
end

execute 'reload_shell' do
  command 'source /root/.ssh/.bash_profile'
  action :nothing
end
