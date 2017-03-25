class DownloadController < ApplicationController
  def index
    ua = request.env['HTTP_USER_AGENT'].downcase
    if ua.include?('iphone')||ua.include?('ipod')||ua.include?('ipad')
      render :text => "敬请期待！"
      #redirect_to 'https://itunes.apple.com/app/id937987572'
    elsif ua.include?('android')||ua.include?('android')
      send_file("#{Rails.root}/public/apk/jam_smarthome.apk")
    else
      send_file("#{Rails.root}/public/apk/jam_smarthome.apk")
    end
  end
end