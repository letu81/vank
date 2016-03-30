ActiveAdmin.register DiscountEvent do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :body, :expired_on, :score, :owners_raw, :coupon_ids_raw

filter :code
filter :title
filter :body
filter :expired_on
filter :score
filter :coupon_ids
filter :created_at

index do
  selectable_column
  column('#', id) { |e| link_to e.id, admin_discount_event_path(e) }
  column :code, sortable: false
  column :title, sortable: false
  column :expired_on
  column :score
  column :coupon_ids, sortable: false
  column :owners, sortable: false
  column :created_at
  actions
end

form do |f|
  f.semantic_errors
  f.inputs do
    f.input :title
    f.input :body
    f.input :expired_on
    f.input :score
    f.input :coupon_ids_raw, as: :text, label: "优惠券ID", placeholder: '关联的优惠券ID集合，ID之间用换行符分隔'
    f.input :owners_raw, as: :text, label: "活动所属用户", placeholder: '活动所属用户ID集合，ID之间用换行符分隔，如果该活动属于所有用，那么该字段留空'
  end
  f.actions
end


end
