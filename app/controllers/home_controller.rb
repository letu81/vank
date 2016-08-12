class HomeController < ApplicationController
  caches_page :index, :about, :agent, :contact, :detail, :dynamic, :faq, :jobs, :service, :wap

  def index
    ua = request.env['HTTP_USER_AGENT'].downcase
    if ua.include?('android') || ua.include?('iphone')
      redirect_to action: :wap
    else
      render layout: false
    end
  end

  def about
    render layout: false
  end

  def agent
    render layout: false
  end

  def contact
    render layout: false
  end

  def detail
    render layout: false
  end

  def dynamic
    render layout: false
  end

  def faq
    render layout: false
  end

  def jobs
    render layout: false
  end

  def service
    render layout: false
  end

  def wap
    render layout: false
  end
end
