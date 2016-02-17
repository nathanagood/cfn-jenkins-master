# Recipe for Jenkins Master Server

This recipe uses the [Chef Jenkins cookbook](https://github.com/chef-cookbooks/jenkins) as a starting point.

It allows you to stand up a Jenkins master with a set of plugins installed based on the type of development you
are doing. In other words, if you are doing Java development you can put the following line in your 
`defaults.rb` file:

    TODO example configuration
 
The following plugins will be installed for you:

* PMD
* Cobertura
* JUnit

You can supply more than one value. Valid values are:

* AWS
* Java
* Groovy
* Docker

The intention of this is to not provide an exhaustive list of plugins or to be too perscriptive with plugins. The
intention is to provide a starting point that may be used to quickly configure a full-featured Jenkins server.


## Developing and testing changes

To test these recipes, type the following commands locally:

    $ bundle install
    $ bundle exec kitchen test

