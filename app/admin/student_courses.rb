ActiveAdmin.register StudentCourse do
  permit_params do
    StudentCourse.column_names.map(&:to_sym)
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :course_id, :student_id, :average_grade, :credit_obtained
  #
  # or
  #
  # permit_params do
  #   permitted = [:course_id, :student_id, :average_grade, :credit_obtained]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
