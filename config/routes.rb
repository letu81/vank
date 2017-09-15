Rails.application.routes.draw do
  
  mount RedactorRails::Engine => '/redactor_rails'

  #web
  get '' => 'home#index', as: :home
  get 'about' => 'home#about', as: :about
  get 'dynamic' => 'home#dynamic', as: :dynamic
  get 'dynamic/:id' => 'home#detail', as: :detail
  get 'contact' => 'home#contact', as: :contact
  get 'jobs' => 'home#jobs', as: :jobs
  get 'news' => 'home#news', as: :news
  get 'service' => 'home#service', as: :service
  get 'faq' => 'home#faq', as: :faq
  get 'partners' =>'home#partners', as: :partners
  get 'wap' => 'home#wap', as: :wap

  get 'download' => 'download#index', as: :download
  post 'feedback' => 'home#feedback', as: :feedback

  get '/customize' => 'customize#index', as: :customize
  get '/customize/app' => 'customize#app', as: :customize_app
  get '/customize/web' => 'customize#web', as: :customize_web
  get '/customize/gateway' => 'customize#gateway', as: :customize_gateway
  get '/customize/lock' => 'customize#lock', as: :customize_lock
  get '/customize/wechat/subscription' => 'customize#wechat_subscription', as: :customize_wechat_subscription
  get '/customize/wechat/applet' => 'customize#wechat_applet', as: :customize_wechat_applet
  get '/customize/alipay/applet' => 'customize#alipay_applet', as: :customize_alipay_applet

  resources :products, only: [:index, :show] do
    collection do
      get :gateway
      get :lock
    end
  end

  get 'search' => 'search#query', as: :search

  ######################### 微信公众平台开发 ###########################
  post '/wechat' => 'weixin/home#welcome', defaults: { format: 'xml' }
  get "/wechat" => 'weixin/home#show'
  get "/fetch_access_token" => 'weixin/home#fetch_access_token'
  
  # 微信商城
  namespace :wechat_shop, path: 'wx-shop' do
    root 'home#index'
    resources :pages, path: :p, only: [:show]
    resources :products, only: [:show]
    resources :orders, only: [:index, :show, :new, :create] do
      collection do
        get :no_pay
        get :shipping
        post :payment
      end
    end
    
    resources :shipments
    # resources :coupons
    resources :discountings, path: :coupons, as: :coupons, only: [:index, :new, :create]
    # resource :discount_event, path: :event, as: :event, only: [:index] do
    #   post :active, on: :member
    # end
    
    resource  :user do
      patch 'update_current_shipment' => 'users#update_current_shipment'
      collection do
        get :orders
        get :no_pay_orders
        get :shipping_orders
      end
      get :settings, on: :member
      get :events,   on: :member
      get :invite,   on: :member
      get :rewards,  on: :member
    end
    
    get    'login'    => 'sessions#new',       as: :login
    get    'redirect' => 'sessions#save_user', as: :redirect_uri
    delete 'logout'   => 'sessions#destroy',   as: :logout
    post   '/orders/notify'   => 'orders#wx_pay_notify'
    # get   '/orders/notify'   => 'orders#notify',      as: :notify
  end
  
  ############################### end ################################
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  require 'sidekiq/web'
  authenticate :admin_user do
    mount Sidekiq::Web => 'sidekiq'
  end
  
  mount GrapeSwaggerRails::Engine => '/apidoc'
  mount API::Dispatch => '/api'
end