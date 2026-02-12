# Development Guide

Some additional (and some redundant) information regarding Palendar development,
including details on the application configuration, running tests, and making
changes to the app.

## Configuration

Key configuration files:
- `config/database.yml` - Database configuration
- `config/routes.rb` - Application routing

## Installation

### Requirements

The following are required to run the application:

* Ruby 3.2+
* Rails 7.2.3
* SQLite3

Additional modules need to be version pinned to run tests.
Install these dependences with bundle.

```
bundle install
```

### Creating the database
```
bin/rails db:create
bin/rails db:migrate
```

## Running the app

You can run an empty version of the app with:
```
bin/rails server
```

The public and admin entrypoints for the application will be on:
 - Public event listing: http://127.0.0.1:3000/
 - Admin event listing: http://127.0.0.1:3000/admin/events

By default, the app serves requests on port `3000`. If this port is busy, or if
you otherwise need to specify an alternate port for the web server, you can do
so by setting the `PORT` environment variable before running the server.
```
export PORT=4001
bin/rails server
```
Or by passing the port value using the `-p` or `--port` flag:
```
bin/rails s -p 4002
```

## Testing

### Loading test data
```
bin/rails db:fixtures:load
```

### Running tests
Run all unit tests:
```
bin/rails test
```

Run a specific system tests:
```
bin/rails test -b test/system/admin/events_test.rb
```

Run specific test files:
```
bin/rails test test/models/event_test.rb
bin/rails test test/controllers/events_controller_test.rb
bin/rails test test/system/admin/events_test.rb
```