# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- 3.0.2

* Rails version
- 6.1.4

* System dependencies
- devise_token_auth
- letter_opener, ~> 1.7
- mongoid, ~> 7.0.5
- redis, ~> 4.0
- responders

* Configuration

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

# To install devise
`rails g devise:install`
- Add `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }` to *config/enviroments/development.rb*
- Change email on devise.rb
  - `config.mailer_sender = 'devise@example.com'`
- Change format
  - `config.navigational_formats = [:json]`

# Devise Token Auth (IMPORTANT)
Command lines may be incompatible with MongoDB as it uses ActiveRecord. That way, we can create the necessary files for configuration manually.
The files we can analyze are:
- *application_controller.rb*
- *users_controller.rb*
- *user.rb*
- *devise_token_auth.rb*

Inside of *devise_token_auth.rb*, we need to change some lines:
`config.change_headers_on_each_request = false` -> Makes it not necessary to pass the generated token in the header
`config.check_current_password_before_update = :password` -> If it is necessary to change the user data, it will be necessary to inform the password
`config.send_confirmation_email = true` -> When change the email, it will be necessary to send the confirmation
`config.default_confirm_success_url = 'http://localhost:4200/login'`
`config.default_password_reset_url = 'http://localhost:4200/reset-password'`
`config.remove_tokens_after_password_reset = true`
