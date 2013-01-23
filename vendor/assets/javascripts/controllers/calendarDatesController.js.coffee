class CalendarDatesController extends Spine.Module
  constructor: (element) ->
    @element = element
    @initializeDates()

  initializeDates: () ->
    for el in @element.find('.date')
      date = CalendarDate.create(
        element: $(el)
        date: $(el).data('date')
        active: false
      )
      @initializeEventSelect(date)

  initializeEventSelect: (date) ->
    date.element.bind('click', () ->
      date.trigger('activate')
      CalendarDate.deactivateAllDates()
      date.updateAttributes(active: true)
    )
    date.bind('activate', (date) ->
      CalendarEvent.deactivateAllEvents()
      CalendarEvent.activateAllEventsOn(date.date)
    )
    date.bind('change', (date) ->
      if date.active == true
        date.element.addClass('selected')
      if date.active == false
        date.element.removeClass('selected')
    )

window.CalendarDatesController = CalendarDatesController
