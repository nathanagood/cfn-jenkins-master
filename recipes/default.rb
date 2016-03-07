#
# Cookbook Name:: cfn-jenkins-server
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
#

include_recipe 'jenkins::master'
include_recipe '::users'
include_recipe '::plugins'
include_recipe '::backup_restore'
include_recipe '::seed_job'
# include_recipe '::add_authentication'