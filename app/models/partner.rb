class Partner < ActiveRecord::Base
  validates :name, :mobile, :address, :service_scope, :pay_type, :pay_account, :pay_card_no, presence: true
  
  def self.pay_types
    types = SiteConfig.pay_types || '支付宝,微信'
    types.split(',')
  end
end
