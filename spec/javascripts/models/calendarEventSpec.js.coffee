describe 'CalendarEvent', () ->
  describe 'activateAllEventsOn', () ->
    it 'activates all event on specific date', () ->
      date = '2013-01-01'
      event = CalendarEvent.create(held_on: date, active: false)
      CalendarEvent.activateAllEventsOn(date)
      expect(CalendarEvent.first().active).toEqual(true)

  describe 'deactivateAllEvents', () ->
    it 'deactivates all events', () ->
      event = CalendarEvent.create(date: '2013-01-01', active: true)
      CalendarEvent.deactivateAllEvents()
      expect(CalendarEvent.first().active).toEqual(false)
