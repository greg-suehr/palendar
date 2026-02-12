# System

* SQLite
* ERB Views
* No authentication
* The admin namespace

## Architecture 
* Ruby on Rails powers the web application and database interactions
* SQLite is the database (development/test)

## Routing

The application has two main route areas:

The `public` namespace:
- `root` → `events#index` - Public event listing
- `GET /events` → `events#index` - Event listing
- `GET /events/:id` → `events#show` - Event details

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

There are two controllers `EventsController` and `Admin::EventsController`.

Styling happens in `app/layouts/application.html.erb`.

## Form Errors

Form validation errors with: https://guides.rubyonrails.org/configuring.html#config-action-view-field-error-proc
per https://guides.rubyonrails.org/active_record_validations.html#customizing-error-field-wrapper

## Model Validations

Events can have the same start_time and end_time (instant/point-in-time events).

## Model Queries

### Sorts
| scope | query description | use case |
|---|---|---|
| current | All published events with an end time after the current time. |  |
| today | All published events with a start time after the beginning of today. |  |
| prior_published | Published events with an end time before the end of yesterday. | |
| published | All published events. Essentially, a current public archive. | |
| draft | All unpublished events. | |

### Filters
| scope | query description | use case |
|---|---|---|
| current | All published events with an end time after the current time. |  |
| today | All published events with a start time after the beginning of today. |  |
| prior_published | Published events with an end time before the end of yesterday. | |
| published | All published events. Essentially, a current public archive. | |
| draft | All unpublished events. | |