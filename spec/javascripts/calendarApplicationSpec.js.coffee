describe 'calendar application bootstrap', () ->
  beforeEach () ->
    loadFixtures('monthly_calendar.html')
    CalendarApplication.initialize()

  afterEach () ->
    CalendarDate.destroyAll()
    CalendarEvent.destroyAll()

  describe 'controllers', () ->
    describe 'CalendarDatesController', () ->
      it 'creates Date instances from DOM', () ->
        expect(CalendarDate.count()).toEqual(2)

    describe 'CalendarEventsController', () ->
      it 'creates Date instances from DOM', () ->
        expect(CalendarEvent.count()).toEqual(3)

      it 'hides all events by default', () ->
        for el in $('.event_detail')
          expect(el).toBeHidden()

  describe 'initialization', () ->
    spyOn(CalendarApplication, 'initializeHistory')
    CalendarApplication.initialize({ history: true, basePath: '/calendars' })
    expect(CalendarApplication.initializeHistory).toHaveBeenCalledWith('/calendars')

  describe 'integration', () ->
    it 'when activate a calendar date ,all events on the date is activated', () ->
      date = CalendarDate.findByAttribute('date', '2012-01-18')
      date.trigger('activate')
      events = CalendarEvent.findAllByAttribute('held_on', '2012-01-18')

      expect(events.length).toEqual(2)
      for event in events
        expect(event.active).toEqual(true)

      expect(CalendarEvent.findByAttribute('held_on', '2012-01-04').active).toEqual(false)

    it 'when click a calendar date, all events on the date is shown', () ->
      CalendarDate.findByAttribute('date', '2012-01-18').element.click()

      expect(CalendarDate.findByAttribute('date', '2012-01-18').element).toHaveClass('selected')
      expect(CalendarDate.findByAttribute('date', '2012-01-04').element).not.toHaveClass('selected')
      expect(CalendarEvent.findByAttribute('held_on', '2012-01-04').element).toBeHidden()

      for event in CalendarEvent.findAllByAttribute('held_on', '2012-01-18')
        expect(event.element).toBeVisible()

      CalendarDate.findByAttribute('date', '2012-01-04').element.click()

      expect(CalendarDate.findByAttribute('date', '2012-01-04').element).toHaveClass('selected')
      expect(CalendarDate.findByAttribute('date', '2012-01-18').element).not.toHaveClass('selected')

      for event in CalendarEvent.findAllByAttribute('held_on', '2012-01-18')
        expect(event.element).toBeHidden()

      expect(CalendarEvent.findByAttribute('held_on', '2012-01-04').element).toBeVisible()
