module MyCalendarHelper
  def previous_month_path(calendar)
    date = calendar.base_date.beginning_of_month - 1.month
    date_to_path(date)
  end

  def next_month_path(calendar)
    date = calendar.base_date.beginning_of_month + 1.month
    date_to_path(date)
  end

  def today_path(calendar)
    date_to_path(Date.today)
  end

  def page_title
    "#{t('date.month_names')[@calendar.base_date.month]}: Event Calendar Demo: Rails #{Rails.version}"
  end

  private

  def date_to_path(date)
    my_calendar_index_path + date.strftime('/%Y/%m/%d')
  end
end
