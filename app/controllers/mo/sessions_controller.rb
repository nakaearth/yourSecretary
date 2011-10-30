class Mo::SessionsController < AbstractMobileController
  
  def index
    @user = User.where("provider=?",params[:user][:provider]).where("uid=?",params[:user][:uid])
    
  end
  
end
