ActiveAdmin.register SiteConfig do

menu priority: 3, label: "站点配置", parent: "系统管理"

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :key, :value, :note
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.semantic_errors
  f.inputs "基本信息" do
    f.input :key,     placeholder: '例如：regions or menu'
    f.input :value,    placeholder: '多个值用英文,隔开 例如：深圳,广州'
    f.input :note,    placeholder: '附加说明 例如：配送区域'

  end
  
  f.actions
end

end
