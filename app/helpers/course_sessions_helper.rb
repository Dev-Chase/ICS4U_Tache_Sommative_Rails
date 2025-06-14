module CourseSessionsHelper
  def number_to_day(num)
    days_of_week = %w[Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday]
    return days_of_week[num]
  end
end
