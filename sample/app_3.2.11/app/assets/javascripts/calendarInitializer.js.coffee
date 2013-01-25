jQuery ($) ->
  CalendarApplication.initialize()
  baseDatelement = CalendarDate.findByAttribute('date', $('.calendar').data('base-date')).element
  baseDatelement.click() if baseDatelement.hasClass('has_events')
