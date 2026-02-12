# Development Guide

Some additional (and some redundant) information regarding Palendar development,
including details on the application configuration, running tests, and making
changes to the app.

## Configuration

Key configuration files:
- `config/database.yml` - Database configuration
- `config/routes.rb` - Application routing

## Installation

### Creating the database
```
bin/rails db:create
bin/rails db:migrate
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