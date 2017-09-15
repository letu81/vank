class ProductsController < ApplicationController
  before_filter :get_product, :except => [:index]

  def index
    @products = []
    @products = Product.saled.no_delete.sorted

  	render layout: false
  end

  def gateway
  	id = params[:id].blank? ? 1 : params[:id]
    @product = Product.find(id)
    @hot_products = Product.saled.no_delete.except(id).sorted.limit(3)
    #fresh_when(etag: [@product])
    render 'products/show', :layout => false
  end

  def lock
    #fresh_when(etag: [@product])
	  render 'products/show', :layout => false  
  end

  def show
    #fresh_when(etag: [@product])
    render :layout => false  
  end

  private
    def get_product
      id = params[:id].blank? ? 1 : params[:id]
      @product = Product.find(id)
      @hot_products = Product.saled.no_delete.except(id).sorted.limit(3)
    end
end