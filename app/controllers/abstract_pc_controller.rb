class AbstractPcController < ApplicationController
  protect_from_forgery
  helper_method :current_user
  #before_filter :redirect_if_mobile
  include ::SslRequirement
  
  private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => e
      @current_user,session[:user_id] = nil
    end
  end

  private
  def redirect_if_mobile
    if request.mobile?
      pa = params.dup
      pa[:controller]="/mo/sessions"
      pa[:action]="index"
      redirect_to pa
    elsif request.smart_phone?
      pa=params.dup
      pa[:controller]="/smt/sessions"
      pa[:action]="index"
      redirect_to pa
    end
  end

 
end
