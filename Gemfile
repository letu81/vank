source 'https://ruby.taobao.org'

ruby '2.4.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.8'

gem 'sprockets'
gem 'sass-rails'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# 微信网页UI
# gem 'weui-rails'

# 队列处理消息发送
gem 'sidekiq'
gem 'sinatra', :require => nil

# redis
gem 'redis'
gem 'hiredis'
# redis 命名空间
gem 'redis-namespace'
# 将一些数据存放入 Redis
gem 'redis-objects'

# 使用redis做服务器缓存
gem 'redis-rails'

# 后台管理系统
gem 'activeadmin', '1.1.0'

# 防止大量请求的IP
gem 'rack-attack'

# 支持解析xml
gem 'actionpack-xml_parser'

# Use postgresql as the database for Active Record
gem 'mysql2', '~> 0.4.8'

gem 'dalli', '~> 2.7', '>= 2.7.6'

# 上传组件
# gem 'carrierwave'#, '~> 0.10.0'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick'#,'~> 4.2.7'#, require: false
# 解决大文件上传报内存问题：Cannot allocate memory - identify
gem 'posix-spawn'

# Bootstrap UI
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem "font-awesome-rails"

# 分页
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'bootstrap_helper', '~> 4.2', '>= 4.2.3'

# 用户系统
gem 'devise', '~> 4.3'

# YAML 配置信息
gem 'settingslogic'

# API
gem 'grape'
gem 'grape-entity'
gem 'newrelic-grape'
# for api 跨域访问
gem 'rack-cors', require: 'rack/cors'
gem 'rack-utf8_sanitizer'
# API doc
gem 'grape-swagger'
gem 'grape-swagger-rails'

# 状态机
gem 'state_machine'

# Rich text editor
# gem 'active_admin_editor'
# gem 'trix'
gem 'redactor-rails'

# rest请求
gem 'rest-client'

# Use unicorn as the app server
gem 'puma'

gem 'actionpack-page_caching'

# Use Capistrano for deployment
group :development do
  
  # rails specific capistrano funcitons
  gem 'capistrano-rails', '~> 1.1.0'

  # integrate bundler with capistrano
  gem 'capistrano-bundler'

  # if you are using RBENV
  gem 'capistrano-rbenv', "~> 2.0" 
  
  gem 'capistrano-sidekiq'
  
  # puma server
  # gem 'capistrano3-puma', require: false
  
  gem 'quiet_assets'
  
  gem 'annotate', '~> 2.6.5'
  
  # Better Errors
  gem 'better_errors'
  gem 'binding_of_caller'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
