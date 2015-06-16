class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_online
  before_filter :set_sockjs_server

  private

  def set_online
   current_user.try :touch
  end

  def set_sockjs_server
   if Rails.env.production? 
    @sockjs_server = ENV['SOCKJS_SEVER_URL']
   else
    @sockjs_server = 'localhost:9000'
   end
  end
end
