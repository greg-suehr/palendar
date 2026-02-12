# Palendar

Palendar is a Rails powered web application that allows you to manage a public listing of events.

# Design

Features:
  - Create, edit, and publish events to a public feed.
  - Quickly publish (or unpublish, oops!) events from the Admin: Events listing
  -

## System Design

Additional details can be found in the [System Design Document](doc/SYSTEM.md).

# Requirements and Setup

## Requirements
* Ruby 3.2+
* Rails 7.2.3
* SQLite3

## Setup

Refer to the Quick Start guide below for a short walkthrough of how to setup the
app on your local device. You can find additional instructions in the
[Development Guide](doc/DEVELOPMENT.md).

### Quick Start
1. Clone this project.
2. `cd` to the project directory
```
cd proto-invite
```
3. Run bundle to install dependencies required in the Gemfile. Primarily, this
ensures the correct Rails version for the project, and appropriate versions of
`capybara`, `minitest`, and `selenium-webdriver` used for testing the app.

```
bundle install
```
4. Follow the instructions below to create the database.

## Creating the database
```
bin/rails db:create
bin/rails db:migrate
```

Viola! You have an app.

You can run an empty version of the app with:
```
bin/rails server
```

Or, you can load test fixtures to see the app in action, using the steps below.
More information on the test data fixtures can be found in the [Development Guide](doc/DEVELOPMENT.md).

### Loading test data
```
bin/rails db:fixtures:load
```

## Running the application
```
bin/rails server
```

## Running tests
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