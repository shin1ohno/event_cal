class CalendarEventsController extends Spine.Module
  constructor: (element) ->
    for el in element.find('.event_detail')
      event = CalendarEvent.create(
        element: $(el).hide()
        held_on: $(el).data('event-date')
        active: false
      )
      @initializeEventSelect(event)

  initializeEventSelect: (event) ->
    event.bind('change', () ->
      if event.active == true
        event.element.show()
      if event.active == false
        event.element.hide()
    )

window.CalendarEventsController = CalendarEventsController
