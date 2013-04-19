jQuery ($) ->
  CalendarApplication.initialize(history: true, basePath: '/my_calendar')
  baseDatelement = CalendarDate.findByAttribute('date', $('.calendar').data('base-date')).element
  baseDatelement.click() if baseDatelement.hasClass('has_events')
