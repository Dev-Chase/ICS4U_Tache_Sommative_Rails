ActiveAdmin.register Teacher do
  permit_params do
    Teacher.column_names.map(&:to_sym)
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_name, :last_name, :age, :main_subject_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :age, :main_subject_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
