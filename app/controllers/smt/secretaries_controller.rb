class Smt::SecretariesController < AbstractSmtController
  def index
    current_user
    unless session[:user_id] ==nil
      @secretaries = Secretary.where("user_id =?",session[:user_id]).latest.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def show
  end

  def create
  end

  def update
  end

  def new
     @secretary = Secretary.new
    current_user
    @secretary.cleverness=2
    @secretary.accuracy=2
  end

  def edit
  end

  def destroy
  end

end
