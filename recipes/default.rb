#
# Cookbook Name:: cfn-jenkins-server
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt::default'
include_recipe 'users'
include_recipe 'plugins'
include_recipe 'add_authentication'