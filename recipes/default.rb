#
# Cookbook Name:: bash_history_timestamp
# Recipe:: default
#
# Copyright (c) 2015 Dan Stark <dstark75@gmail.com>, All Rights Reserved.

file '/root/.bash_profile' do
  action :create_if_missing
  mode 0400
  owner 'root'
  group 'root'
end

replace_or_add 'HISTTIMEFORMAT' do
  path '/root/.bash_profile'
  pattern 'export HISTTIMEFORMAT*'
  line "export HISTTIMEFORMAT='#{node['bash_history_timestamp']['flags']}'"
  notifies :run, 'bash[reload_shell]', :immediately
end

bash 'reload_shell' do
  code "source /root/.bash_profile"
  action :nothing
end
