ActiveAdmin.register Subject do
  permit_params do
    Subject.column_names.map(&:to_sym)
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :code, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :code, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
