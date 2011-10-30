class SecretariesController < AbstractPcController
  # GET /secretaries
  # GET /secretaries.xml
  def index
    #redirect_to_smt
    current_user
    unless session[:user_id] ==nil
      @secretaries = Secretary.where("user_id =?",session[:user_id]).latest.paginate(:page => params[:page], :per_page => 5)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @secretaries }
    end
  end

  # GET /secretaries/1
  # GET /secretaries/1.xml
  def show
    @secretary = Secretary.find(params[:id])
    if @secretary.secretary_word_id != nil
      @secretary_word = SecretaryWord.find @secretary.secretary_word_id
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @secretary }
    end
  end

  # GET /secretaries/new
  # GET /secretaries/new.xml
  def new
    @secretary = Secretary.new
    current_user
    @secretary.cleverness=2
    @secretary.accuracy=2
     respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @secretary }
    end
  end


  # GET /secretaries/1/edit
  def edit
    @secretary = Secretary.find(params[:id])
  end

  # POST /secretaries
  # POST /secretaries.xml
  def create
    @secretary = Secretary.new(params[:secretary])
    @user = current_user
    @secretary.user_id = @user.id
    respond_to do |format|
      if @secretary.save_and_update_word
        format.html { redirect_to(@secretary, :notice => 'Secretary was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @secretary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /secretaries/1
  # PUT /secretaries/1.xml
  def update
    @secretary = Secretary.find(params[:id])
    @user = current_user
    @secretary.user_id = @user.id
    @secretary.main_flag = params[:secretary][:main_flag]
    respond_to do |format|
      if @secretary.update_attributes_and_update_word(params[:secretary])
        format.html { redirect_to(@secretary, :notice => 'Secretary was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @secretary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /secretaries/1
  # DELETE /secretaries/1.xml
  def destroy
    @secretary = Secretary.find(params[:id])
    @secretary.destroy

    respond_to do |format|
      format.html { redirect_to(secretaries_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def redirect_to_smt
   if request.smart_phone?
      pa=params.dup
      pa[:controller]="/smt/secretaries"
      redirect_to pa
    els
      pa=params.dup
      pa[:controller]="/sessions"
      redirect_to pa
    end
  end
end
