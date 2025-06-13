class HomeController < ApplicationController
  def page
    @school_year = "#{Date.today.year}-#{Date.today.year + 1 - 2000}"
    @number_of_students = Student.count
    @number_of_teachers = Teacher.count
    @courses = Course.where(school_year: @school_year)
  end
end
