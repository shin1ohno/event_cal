jQuery ($) ->
  CalendarApplication.initialize()
  baseDatelement = CalendarDate.findByAttribute('date', $('.calendar').data('base-date')).element
  baseDatelement.click() if baseDatelement.hasClass('has_events')

  CalendarDate.all().map(
    (date) ->
      date.element.bind('click', (event) ->
        window?.history?.pushState(
          { dateObjectId: date.id },
          null,
          "../../#{date.toPath()}"
        )
      )
  )

  window.onpopstate = (event) ->
    if event.state?.dateObjectId?
      date = CalendarDate.find(event.state.dateObjectId)
      date.trigger('activate')
      CalendarDate.deactivateAllDates()
      date.updateAttributes(active: true)

