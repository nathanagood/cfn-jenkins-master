# This file contains sensible defaults

# Assume that the user will want git and java
default['java']['install_flavor'] = 'openjdk'
default['java']['jdk_version'] = '8'
# If you're using the 'package' install_method, then to pin the version you would use the following
# line instead
default['jenkins']['master']['version'] = '1.651-1.1'
# If you want to use the 'war' install_method, use the two following lines here to install the LTS
# version
# default['jenkins']['master']['version'] = '1.651.1'
# default['jenkins']['master']['install_method'] = 'war'
default['jenkins_master']['plugin_profiles'] = ['git', 'java', 'aws']