module ApplicationHelper
  def previous_month_navpath(calendar)
    date = calendar.base_date.beginning_of_month - 1.month
    date_to_path(date)
  end

  def next_month_navpath(calendar)
    date = calendar.base_date.beginning_of_month + 1.month
    date_to_path(date)
  end

  def today_navpath(calendar)
    date_to_path(Date.today)
  end

  private
  def date_to_path(date)
    my_calendar_index_path + date.strftime('/%Y/%m/%d')
  end
end
