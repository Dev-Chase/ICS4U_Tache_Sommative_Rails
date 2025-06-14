ActiveAdmin.register TeacherCertification do
  permit_params do
    TeacherCertification.column_names.map(&:to_sym)
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :certifier, :date_obtained, :subject_id, :teacher_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:certifier, :date_obtained, :subject_id, :teacher_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
