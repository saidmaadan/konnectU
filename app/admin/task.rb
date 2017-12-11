ActiveAdmin.register Task do
  permit_params :title, :note, :video, :header, :tag, :project_id

  # sortable tree: false,
	# 				sorting_attribute: :tag
  #
	# index :as => :sortable do
	# 	label :title
  #
	# 	actions
	# end
  #
	# index do
	# 	selectable_column
	# 	column :header
	# 	column :title
	# 	column :tag
	# 	column :project
  #
	# 	actions
	# end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  ## To Customize your form
  # form do |f|
	# 	f.inputs do
	# 		input :project, label: "Project"
	# 		input :title, label: "Title"
	# 		input :note, label: "Note"
	# 		input :video, label: "video"
	# 		input :header, label: "Header"
	# 	end
  #
	# 	actions
	# end
end
