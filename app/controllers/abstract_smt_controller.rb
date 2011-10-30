class AbstractSmtController < ApplicationController
  helper_method :current_user
  hankaku_filter
  
  private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => e
      @current_user,session[:user_id] = nil
    end
  end
end
