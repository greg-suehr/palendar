# Palendar System Design Document

This document contains additional details on the Palendar application design,
and technical details useful when working on the application.

## Architecture

Palendar is a simple application. Manage your public event listing with nothing
more than a web server and database.

* Ruby on Rails powers the web application and database interactions
* SQLite is the database

## Routing

The application has two main route areas:

The `public` namespace:
- `root` - Public event listing
- `GET /events` - Event listing
- `GET /events/:id` - Event details

The `admin` namespace:
- `GET /admin/events` - All events dashboard
- `GET /admin/events/new` - New event form
- `POST /admin/events` - Create event
- `GET /admin/events/:id` - Event details
- `GET /admin/events/:id/edit` - Edit event form
- `PATCH /admin/events/:id` - Update event
- `DELETE /admin/events/:id` - Delete event
- `PATCH /admin/events/:id/publish` - Publish event
- `PATCH /admin/events/:id/unpublish` - Unpublish event

## Controllers and Views

Views for Palendar are relatively simple.
The ActionView `field_error_proc` is probably the most non-obvious convention used
to define the application UI, which is detailed in the Forms section of this document.

There are two controllers `EventsController` and `Admin::EventsController`.
The controller layer contains some logic for filtering and sorting data for
presentation, but primarily use the model scopes described in the Model Queries
section of this document.

HTML is defined in the `.erb.` files under `app/views/events/` and `app/views/admin/events/`.
Some `.erb` templates make use of partials, mostly to keep some specific logic organized
(`_event_card.html.erb`, `_event_status_badge.html.erb`).

Note that some public and admin templates _don't_ use partials. These might eventually look
the same, or quite different, but some more thought should be put towards componentizing design
patterns.

Styling happens in the `app/layouts/application.html.erb` file. There is no asset pipeline
required or configured, and the prior note regarding further thought toward a design system
should be had before continuing on with this approach.

## Forms

The "New Event" page includes a warning to users regarding the required fields
(`title`, `start_time`, `end_time`).

Note that even draft events must have both a `start_time` and an `end_time`. Additional details
on this behavior are noted in the Model Validations section of this document.

Form validation errors are displayed inline using the ActionView `field_error_proc`:
 - https://guides.rubyonrails.org/configuring.html#config-action-view-field-error-proc
 - https://guides.rubyonrails.org/active_record_validations.html#customizing-error-field-wrapper

## Model Validations

The Event model enforces several rules, which manifest as form errors on the "New Event" page:
  - Events must have a title
  - Events must have a start_time an end_time
  - An end_time must greater than or equal to the start_time.

Note: events are allowed to have the same start_time and end_time ("point-in-time events")
as a convenient way to allow users to save draft events before a defined time is known, or
to represent events without an explicit end time.

## Model Queries

The following model scopes should be used when getting data for presentation in the application,
as they contain repeatable, standard business logic that helps maintain consistent default behaviors
across the application.

If the defined scopes do not sort new development, you should consider expanding the model before writing an ad-hoc query.

### Sorts
| scope | query description | use case |
|---|---|---|
| by_start_time | Next starting event first, ascending by start_time. | Used for the public events feed.  |
| by_end_time | Next ending event first, then ascending by end_time. | Useful alternate sort for feeds, as active events happen to sort first. |

### Filters
| scope | query description | use case |
|---|---|---|
| current | All published events with an end time after the current time. | Used for the public events feed. |
| today | All published events with a start time after the beginning of today. | Display today's ended events. |
| prior_published | Published events with an end time before the end of yesterday. | Display historical events. |
| published | All published events. Essentially, a current public archive. | Display a full catalog of current, draft, and historical events. |
| draft | All unpublished events. | Filter the admin event listing to show only unpublished events. |