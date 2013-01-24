class CalendarApplication
  calendarElements =
    'ul.dates': CalendarDatesController
    'ul.event_details': CalendarEventsController

  @initialize = () ->
    for element, controller of calendarElements
      for el in $(element)
        new controller($(el))

window.CalendarApplication = CalendarApplication

jQuery ($) -> CalendarApplication.initialize()
