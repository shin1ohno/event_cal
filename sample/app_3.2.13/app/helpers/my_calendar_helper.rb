module MyCalendarHelper
  def path_to_previous_month(calendar)
    date = calendar.base_date.beginning_of_month - 1.month
    date_to_path(date)
  end

  def path_to_next_month(calendar)
    date = calendar.base_date.beginning_of_month + 1.month
    date_to_path(date)
  end

  def path_to_today(calendar)
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
