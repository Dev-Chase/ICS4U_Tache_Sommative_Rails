ActiveAdmin.register CourseSession do
  permit_params do
    CourseSession.column_names.map(&:to_sym)
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :course_id, :room_id, :start_time, :duration, :day_of_week
  #
  # or
  #
  # permit_params do
  #   permitted = [:course_id, :room_id, :start_time, :duration, :day_of_week]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
