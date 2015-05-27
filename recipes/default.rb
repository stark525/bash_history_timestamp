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

ruby_block "ensure HISTTIMEFORMAT is in .bash_profile" do
  block do
    fe = Chef::Util::FileEdit.new("/root/.ssh/.bash_profile")
    fe.insert_line_if_no_match(/export HISTTIMEFORMAT/, /export HISTTIMEFORMAT='#{node['bash_history_timestamp']['flags']}'/)
    fe.write_file
  end
end

execute 'reload_shell' do
  command 'source /root/.ssh/.bash_profile'
  action :nothing
end
