jQuery ($) ->
  CalendarApplication.initialize(history: true, basePath: '/my_calendar')
  baseDatelement = CalendarDate.findByAttribute('date', $('.calendar').data('base-date')).element
  baseDatelement.click() if baseDatelement.hasClass('has_events')

  $('.calendar').bind('swipeleft', ->
    window.location = $('.navigation.previous').attr('href')
  )

  $('.calendar').bind('swiperight', ->
    window.location = $('.navigation.next').attr('href')
  )
