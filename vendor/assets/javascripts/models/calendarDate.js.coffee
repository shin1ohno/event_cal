class CalendarDate extends Spine.Model
  @configure 'CalendarDate', 'element', 'date', 'active'

  @deactivateAllDates: () ->
    CalendarDate.each( (date) -> date.updateAttributes(active: false))

window.CalendarDate = CalendarDate
