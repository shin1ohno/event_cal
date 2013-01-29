[![Travis CI](https://travis-ci.org/shin1ohno/event_cal.png?branch=master)](https://travis-ci.org/shin1ohno/event_cal)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/shin1ohno/event_cal)

# EventCal #

EventCal is a calendar with events on it.

<img src='https://raw.github.com/shin1ohno/event_cal/gh-pages/images/sp_sample.png' width = '35%' height= 'auto'>

You can easily

- create and display many kinds of events
- customize how events displayed
- integrate events with existing model

## Use EventCal ##

```ruby
gem 'event_cal', github: 'shin1ohno/event_cal'
```

1. create calendar instance in controller and call ```render_monthly(@calendar)``` in view. simple sample code is below. ***only with this step, you basically can get calendar view***
2. create event class that extends ::EventCal::Events
3. create partial for each event. with sptep 2 and 3 it's automatically shown in calendar view

```sample/app_***``` directory contains sample rails application that shows how you do. This sample runs as normal rails application.

```ruby
class MyCalendarController < ApplicationController
  def index
    @calendar = ::EventCal::Calendar.new(Date.today)
  end

  def show
    date = Date.parse("#{params[:year]}-#{params[:month]}-#{params[:date]}")
    @calendar = ::EventCal::Calendar.new(date)
  end
end
```

```haml
.calendar_view
  = render_monthly(@calendar)
  = render_event_details(@calendar.events) # if you need event details view
```

```ruby
# typically, you may want to draw routes like this
App3211::Application.routes.draw do
  resources :my_calendar do
    collection do
      get ':year/:month/:date' => 'my_calendar#show', :constraints => { :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/ }
    end
  end
end
```
you can use default style for 7days * 4~5 weeks calendar

```css
/*
 in application.css... add sprockets manifest like
 *= require_self
 *= require event_cal
 *= require_tree .
 */
```

you can use basic event detail selector implemented in JavaScript with [Spine.js](http://spinejs.com)

```javascript
// in application.js... add sprockets manifest like
//= require jquery
//= require jquery_ujs
//= require event_cal
//= require_tree .
// and then initialize like this...

jQuery(function($) {
  var baseDatelement;
  CalendarApplication.initialize();
  baseDatelement = CalendarDate.findByAttribute('date', $('.calendar').data('base-date')).element;
  if (baseDatelement.hasClass('has_events')) {
    return baseDatelement.click();
  }
});
```

## Develop EventCal ##

### running tests ###

```bundle exec rake``` runs all examples

- Ruby code is tested by rspec
- JavaScript code is tested by jasmine
- For auto testing, I use [tork](https://github.com/sunaku/tork) for ruby code and [Guard support for jasmine-headless-webkit](https://github.com/johnbintz/guard-jasmine-headless-webkit) for JavaScript code

```bundle``` first. ```bundle exec tork``` then hit a to run all rspec examples. ```bundle exec guard``` then hit return to run all jasmine expamples

## Thanks ##

- [Takada Satoshi](https://github.com/satoship) for giving many great ideas for implementation
- [Takuji Ikeda](https://github.com/tikeda) for giving sweet design

## License ##

This project uses MIT-LICENSE.
