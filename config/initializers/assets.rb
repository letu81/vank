# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(
	wechat.css 
	wechat.js 
	home/style.css
 	home/home.js
 	home/jquery.touchSlider.js
 	home/jquery-1.7.1.min.js
 	home/homeban.js
 	home/plus2015.js
 	home/stellar.js
)