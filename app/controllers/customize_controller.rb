class CustomizeController < ApplicationController
  #caches_page :index, :app, :web, :gateway, :lock, :dynamic, :wechat_subscription, :wechat_applet

  def index
    render layout: false
  end

  def app
    render layout: false
  end

  def web
  	render layout: false
  end

  def gateway
    render layout: false
  end

  def lock
    render layout: false
  end

  def wechat_subscription
    render layout: false
  end

  def wechat_applet
    render layout: false
  end

  def alipay_applet
    render layout: false
  end
end