# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

%w(help service).each do |tag|
  Page.create(title: tag, body: "#{tag} todo", slug: tag)
end

%w(wx_share_title wx_share_body wx_share_link ship_and_stock_info coupon_fetch_msg_tpl 
	order_paid_msg_tpl marketers still_reward_users ratio_reward_users ratio_reward_stragy).each do |tag|
  SiteConfig.create(key: tag, value: "#{tag} todo", note: '')
end

SiteConfig.create(key: 'regions', value: '北京,上海,广东,山东,湖北,四川,重庆,江苏,黑龙江', note: '配送区域')
SiteConfig.create(key: 'pay_types', value: '支付宝,银行卡', note: '支付方式')
SiteConfig.create(key: 'product_units', value: '元/把,元/套', note: '产品单位')
SiteConfig.create(key: 'sf_contact', value: '400-070-5860', note: '官方电话')
SiteConfig.create(key: 'bda_key', value: 'todo', note: '百度统计key')