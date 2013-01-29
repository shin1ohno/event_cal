class CalendarDate extends Spine.Model
  @configure 'CalendarDate', 'element', 'date', 'active'

  @deactivateAllDates: () ->
    CalendarDate.each((date) -> date.updateAttributes(active: false))

  toPath: () ->
    moment(@date).format('YYYY/MM/DD')

window.CalendarDate = CalendarDate
