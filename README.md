# Citizen App

This application was generated with Ruby on Rails. This is a CRUD application for citizens. With sending emails when the user is registered and changed.

## Access the below link to try the application
Create a user to use the application:
* PS: The emails sent can be in your spam box

https://om30-citizen-app.herokuapp.com/


## Ruby on Rails
This application requires:
* rails 5.2.4.5
* ruby 2.6.6

## Database
Thist application uses Postgresql with ActiveRecord

## Development
* Template Engine: ERB
* Testing Framework: RSpec, Capybara and Factory Bot
* Authentication: Devise
* Authorization: None

## Email
The application is configured to send email using Sendgrid Account

## Task for initial development setup

```
rails db:create
rails db:migrate
rails db:seed
```

## Start rails server
```
rails s
```

## To run the tests, execute the bellow command
```
rspec
```