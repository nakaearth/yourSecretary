require 'rubygems'
require 'groonga'

class HaikusController <  AbstractPcController
  layout "haiku"
  # GET /haikus
  # GET /haikus.xml
  def index
    @current_user = current_user
    #@haikus = Haiku.all
    @haikus = Haiku.joins(:user).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @haikus }
    end
  end

  # GET /haikus/1
  # GET /haikus/1.xml
  def show
    @haiku = Haiku.find(params[:id])
    @current_user = current_user
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @haiku }
    end
  end

  # GET /haikus/new
  # GET /haikus/new.xml
  def new
    @haiku = Haiku.new
    @current_user = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @haiku }
    end
  end

  # GET /haikus/1/edit
  def edit
    @current_user = current_user
    @haiku = Haiku.find(params[:id])
  end

  # POST /haikus
  # POST /haikus.xml
  def create
    @current_user = current_user
    @haiku = Haiku.new(params[:haiku])
    @haiku.user_id=@current_user.id
    @haiku_search=HaikuSearch.new
    @haiku_search.sentence=params[:haiku][:sentence]
    respond_to do |format|
      if @haiku.save && @haiku_search.save
        @haiku_search.save
        format.html { redirect_to(@haiku, :notice => 'Haiku was successfully created.') }
        format.xml  { render :xml => @haiku, :status => :created, :location => @haiku }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @haiku.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /haikus/1
  # PUT /haikus/1.xml
  def update
    @current_user = current_user
    @haiku = Haiku.find(params[:id])

    respond_to do |format|
      if @haiku.update_attributes(params[:haiku])
        format.html { redirect_to(@haiku, :notice => 'Haiku was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @haiku.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /haikus/1
  # DELETE /haikus/1.xml
  def destroy
    @current_user = current_user
    @haiku = Haiku.find(params[:id])
    @haiku.destroy

    respond_to do |format|
      format.html { redirect_to(haikus_url) }
      format.xml  { head :ok }
    end
  end
end
