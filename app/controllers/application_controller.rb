class ApplicationController < ActionController::Base
  protect_from_forgery
  #has_mobile_fu
  
  before_filter :detect_device
  
  def detect_device
    #if is_mobile_device?
      #prepend_view_path Rails.root + 'app' + 'mobile_views'
    #end
  end
  
  def mobile_request?
    #request.subdomains.first == 'm'
  end
end
