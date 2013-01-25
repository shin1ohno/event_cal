jQuery ($) ->
  CalendarApplication.initialize()
  CalendarDate.findByAttribute('date', $('.calendar').data('base-date')).element.click()
