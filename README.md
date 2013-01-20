# EventCalendar #

EventCalendar is a calendar with events on it.

You can easily

- create and display many kinds of events
- customize how events displayed
- integrate events with existing model

## Use EventCalendar ##

```ruby
gem 'event_calendar', github: 'shin1ohno/event_calendar'
```

1. create calendar instance in controller
2. create event model that extends ::EventCalendar::Events
3. create partial for each event

```sample/app_***``` directory contains sample rails application that shows how you do. This sample runs as normal rails application.

## Develop EventCalendar ##

Run

```
bundle
bundle exec tork
```

then hit a to run all the tests.

## License ##

This project uses MIT-LICENSE.
