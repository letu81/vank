class HomeController < ApplicationController
  #caches_page :index, :about, :contact, :detail, :dynamic, :news, :faq, :jobs, :partners, :service, :wap

  def index
    @products = []
    if request.env['HTTP_USER_AGENT'].downcase.match(/android|iphone/)
      redirect_to action: :wap
    else
      product = Product.find(1)
      @products = []
      (1..6).each do |_|
        @products << product
      end
      render layout: false
    end
  end

  def about
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

  def news
    render layout: false
  end

  def faq
    render layout: false
  end

  def jobs
    render layout: false
  end

  def partners
    render layout: false
  end

  def service
    render layout: false
  end

  def wap
    render layout: false
  end
end