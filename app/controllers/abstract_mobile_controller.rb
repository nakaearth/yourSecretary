class AbstractMobileController < ApplicationController
  helper_method :current_user
  trans_sid
  hankaku_filter
  
  private
  def current_user

  end
end
