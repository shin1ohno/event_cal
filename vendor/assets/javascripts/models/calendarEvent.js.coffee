class CalendarEvent extends Spine.Model
  @configure 'CalendarEvent', 'held_on', 'active', 'element'

  @activateAllEventsOn: (date) ->
    for event in CalendarEvent.findAllByAttribute('held_on', date)
      event.updateAttributes(active: true)

  @deactivateAllEvents: () ->
    CalendarEvent.each((event) -> event.updateAttributes(active: false))

window.CalendarEvent = CalendarEvent
