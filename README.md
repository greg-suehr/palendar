# Palendar

Palendar is a Rails powered web application that allows you to manage a public listing of events.

# Design

Features:
  - Create, edit, and publish events to a public feed.
  - Quickly publish (or unpublish, oops!) events from the Admin: Events listing

## System Design

Palendar uses 

Additional details can be found in the [System Design Document](doc/SYSTEM.md).
  - Routing - list of available actions.
  - Controllers and Views - 
  - Model Queries -
  - Form -

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

## Running the application

You can run an empty version of the app with:
```
bin/rails server
```

The public and admin entrypoints for the application will be on:
 - Public event listing: http://127.0.0.1:3000/
 - Admin event listing: http://127.0.0.1:3000/admin/events

Click "Create your first event" on the Admin event listing page (Admin: Events)
to begin filling out your event calendar!

Or, you can load some test fixtures to see the app in action, using the steps below.
More information on the test data fixtures can be found in the [Development Guide](doc/DEVELOPMENT.md).

### Loading test data
After setting up the project database, run the following:
```
bin/rails db:fixtures:load
```

A set of sample data will overwrite events in the project database (be careful!),
providing a convenient view of all the application features.

## Running tests

Run all unit tests:
```
bin/rails test
```

Run specific test files:
```
bin/rails test test/models/event_test.rb
bin/rails test test/system/admin/events_test.rb
```

Run a specific system tests with a detailed trace (`-b`):
```
bin/rails test -b test/system/admin/events_test.rb
```