name             'cfn-jenkins-server'
maintainer       'Nathan A. Good'
maintainer_email 'nathan.a.good@gmail.com'
license          'All rights reserved'
description      'Installs/Configures cfn-jenkins-server'
long_description 'Installs/Configures cfn-jenkins-server'
version          '0.1.0'

recipe 'plugins', 'Installs a Jenkins master'
recipe 'users', 'Installs a Jenkins master'
recipe 'scriptconfig', 'Installs a Jenkins master'

depends 'java', '~> 1.39.0'
depends 'jenkins',   '~> 2.4.1'
