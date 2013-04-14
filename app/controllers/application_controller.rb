class ApplicationController < ActionController::Base
  protect_from_forgery
before_filter :check_user

def check_user
  
if !session[:user_id].present?
redirect_to '/login'
end
end
end
