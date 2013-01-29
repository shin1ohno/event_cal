describe 'CalendarDate', () ->
  afterEach () -> CalendarDate.destroyAll()

  describe 'deactivateAllDates', () ->
    it 'deactivate all dates', () ->
      date = CalendarDate.create(date: '2013-01-01', active: true)
      expect(CalendarDate.first().active).toEqual(true)
      CalendarDate.deactivateAllDates()
      expect(CalendarDate.first().active).toEqual(false)

  describe 'toPath', () ->
    it 'converts to yyyy/mm/dd string', () ->
      date = CalendarDate.create(date: '2013-01-01', active: true)
      expect(date.toPath()).toEqual('2013/01/01')


