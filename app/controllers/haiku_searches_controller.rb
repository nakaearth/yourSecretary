class HaikuSearchesController < ApplicationController
  # GET /haiku_searches
  # GET /haiku_searches.xml
  def index
    @haiku_searches = HaikuSearch.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @haiku_searches }
    end
  end
  
  # search 
  def search
    @keyword = params[:keyword]
    @result_set = HaikuSearch.select(:sentence=>@keyword)
  end  

  # GET /haiku_searches/1
  # GET /haiku_searches/1.xml
  def show
    @haiku_search = HaikuSearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @haiku_search }
    end
  end

  # GET /haiku_searches/new
  # GET /haiku_searches/new.xml
  def new
    @haiku_search = HaikuSearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @haiku_search }
    end
  end

  # GET /haiku_searches/1/edit
  def edit
    @haiku_search = HaikuSearch.find(params[:id])
  end

  # POST /haiku_searches
  # POST /haiku_searches.xml
  def create
    @haiku_search = HaikuSearch.new(params[:haiku_search])

    respond_to do |format|
      if @haiku_search.save
        format.html { redirect_to(@haiku_search, :notice => 'Haiku search was successfully created.') }
        format.xml  { render :xml => @haiku_search, :status => :created, :location => @haiku_search }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @haiku_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /haiku_searches/1
  # PUT /haiku_searches/1.xml
  def update
    @haiku_search = HaikuSearch.find(params[:id])

    respond_to do |format|
      if @haiku_search.update_attributes(params[:haiku_search])
        format.html { redirect_to(@haiku_search, :notice => 'Haiku search was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @haiku_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /haiku_searches/1
  # DELETE /haiku_searches/1.xml
  def destroy
    @haiku_search = HaikuSearch.find(params[:id])
    @haiku_search.destroy

    respond_to do |format|
      format.html { redirect_to(haiku_searches_url) }
      format.xml  { head :ok }
    end
  end
end
