# Citizen App

This application was generated with Ruby on Rails. This is a CRUD application for citizens. With sending emails when the user is registered and changed.

### Access the link bellow to try the application
Create a user to use the application:
* PS: The emails sent can be in your spam box

https://om30-citizen-app.herokuapp.com/


### Ruby on Rails
This application requires:
* ruby 2.6.6

### Database
This application uses Postgresql 12.1 with ActiveRecord

### Development
* Template Engine: ERB
* Testing Framework: RSpec, Capybara and Factory Bot
* Authentication: Devise
* Authorization: None

### Email
The application is configured to send email using Sendgrid Account

## Docker Deploy
You need followings:
- Docker installed

Learn more about [Docker Setup](https://docs.docker.com/desktop/)

### Try this example
Clone this repository.

```console
$ git clone git@github.com:italopires/citizens_app.git
$ cd citizens_app
```

### Set environment variables
Using [dotenv](https://github.com/bkeepers/dotenv)
```
cp .env.docker.sample .env
```

Up Docker container.

```console
$ docker-compose up
```

Open another console and run this to initialize database.

```console
$ cd citizens_app
$ docker-compose exec rails rake db:create db:migrate db:seed
```

Open in browser.

- [`http://localhost:3000/`](http://localhost:3000/)

To stop, in the console where `docker-compose` is running, hit `Ctrl + C` and wait.

```console
Gracefully stopping... (press Ctrl+C again to force)
Stopping citizens_app_rails_1   ... done
Stopping citizens_app_db_1      ... done
```

## Deploy local through RVM and Ruby
```
rvm install 2.6.6
```
Learn more about [RVM](https://rvm.io/rvm/install) installation

### Install dependencies
Using [Bundler](https://github.com/bundler/bundler)
```
gem install bundler
bundle
```

### Set environment variables
Using [dotenv](https://github.com/bkeepers/dotenv)
```
cp .env.local.sample .env
```

### Task for initial development setup

```
rails db:create
rails db:migrate
rails db:seed
```

### Start rails server
```
rails s -b 0.0.0.0 -p 3000
```

### To run the tests, execute the command bellow
```
rspec
```