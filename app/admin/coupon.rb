ActiveAdmin.register Coupon do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, [:title, :note, :body, :value, :max_value, :expired_on, :coupon_type], :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

filter :title
filter :note
filter :value
filter :max_value
filter :expired_on
filter :coupon_type
filter :created_at

index do
  selectable_column
  column('#',:id) #{ |coupon| link_to coupon.id, admin_coupon_path(coupon) }
  column(:title, sortable: false) #{ |coupon| link_to coupon.title, admin_coupon_path(coupon) }
  column '有效期', :expired_on do |coupon|
    state = coupon.expired? ? "已过期" : "到期"
    "#{coupon.expired_on.strftime('%Y年%-m月%-d日')} #{state}"
  end
  column '优惠额度', :value, sortable: false do |coupon|
    coupon.current_value_info
  end
  column '最大优惠额度', :max_value, sortable: false do |coupon|
    "¥#{coupon.max_value}"
  end
  column '优惠券类型', sortable: false do |coupon|
    coupon.coupon_type_info
  end
  column :note, sortable: false
  column :body, sortable: false
  column '所有者', sortable: false do |coupon|
    if coupon.users.count == 0 
      '未指定用户'
    elsif coupon.users.count == 1
      coupon.users.first.nickname
    elsif coupon.users.count == User.count
      '所有用户'
    else
      "#{coupon.users.count}个用户"
    end
  end
  actions defaults: false do |coupon|
    item "编辑", edit_admin_coupon_path(coupon)
    item "删除", admin_coupon_path(coupon), method: :delete, data: { confirm: '你确定吗？' }
  end
end

form do |f|
  f.semantic_errors
  f.inputs "基本信息" do
    f.input :title,     placeholder: '例如：5折优惠或抵扣5元'
    f.input :value,     placeholder: '该值与优惠券类型有关，如果为抵扣现金类型，那么值为要抵扣的金额；如果为打折类型，那么值为打折的2位百分数，例如：8.5折值为85, 5折值为50'
    f.input :max_value, placeholder: '该值与优惠券类型有关，如果为抵扣现金类型，那么值等于优惠额度，例如：优惠额度为5，那么此处填5；如果为打折类型，那么值为输入的具体金额'
    f.input :expired_on
    f.input :coupon_type, as: :select, collection: Coupon::TYPE_COLLECTIONS
    f.input :note,      placeholder: '优惠券使用限制说明，例如：仅限成都使用，最大优惠8元'
    f.input :body,      placeholder: '可选，对优惠券的简介', label: '简介'
  end
  
  f.actions
end


end