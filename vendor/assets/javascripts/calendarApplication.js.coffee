class CalendarApplication
  calendarElements =
    'ul.dates': CalendarDatesController
    'ul.event_details': CalendarEventsController

  @initialize = (options = {}) ->
    for element, controller of calendarElements
      for el in $(element)
        new controller($(el))

    if options.history
      @initializeHistory(options.basePath)

  @initializeHistory = (basePath) ->
    CalendarDate.all().map(
      (date) ->
        date.element.bind('click', (event) ->
          window?.history?.pushState(
            { dateObjectId: date.id },
            null,
            "#{basePath}/#{date.toPath()}"
          )
        )
    )

    window?.onpopstate = (event) ->
      if event.state?.dateObjectId?
        date = CalendarDate.find(event.state.dateObjectId)
        date.trigger('activate')
        CalendarDate.deactivateAllDates()
        date.updateAttributes(active: true)

window.CalendarApplication = CalendarApplication
