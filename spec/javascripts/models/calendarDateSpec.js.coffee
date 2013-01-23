describe 'CalendarDate', () ->
  describe 'deactivateAllDates', () ->
    it 'deactivate all dates', () ->
      date = CalendarDate.create(date: '2013-01-01', active: true)
      expect(CalendarDate.first().active).toEqual(true)
      CalendarDate.deactivateAllDates()
      expect(CalendarDate.first().active).toEqual(false)

