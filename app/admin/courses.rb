ActiveAdmin.register Course do
  permit_params do
    Course.column_names.map(&:to_sym)
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :code, :school_year, :description, :required_equipment, :teacher_id, :subject_id, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:code, :school_year, :description, :required_equipment, :teacher_id, :subject_id, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
