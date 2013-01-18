module CalendarHelper
  def wday_class_for(date)
    case date.wday
    when 0
      'sunday'
    when 6
      'saturday'
    end
  end

  def wdays_row_for(calendar)
    (calendar.start_on .. calendar.start_on + 6.days).map { |date| l date, :format => :calendar_row }
  end
end
