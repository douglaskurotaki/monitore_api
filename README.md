# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Create Project Command
`rails new monitore --api --skip-active-record --skip-bundle --skip-test --skip-system-test`

# Create MongoDB Configurations
`bin/rails g mongoid:config`


# Configuration RuboCop VSCode
`ruby.rubocop.executePath": "/Users/USER_NAME/.rvm/gems/ruby-2.6.5/wrappers/`

# Api Constraints
In this application there is API versioning. That way, there is no problem making changes to the design. By default it will always match the latest version, just look at the code: `ApiConstraints.new(version: 2, default: true)` where the default is true.