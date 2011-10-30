class UsersController < AbstractPcController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @uploader = ImageUploader.new
    @profile_image=@uploader.retrieve_from_store!(@user.image)
  end

  def update
    @user = current_user
    uploader = ImageUploader.new
    uploader.store!(params[:image])
    @user.image= params[:image]
   
    @user.image.url # => '/url/to/file.png'
    @user.image.current_path # => 'path/to/file.png'
    respond_to do |format|
      if @user.save!
        format.html {redirect_to(@user, :notice=>'Update successfly!')}
      else
        format.html { render :action => "edit" }

      end
    end
  end

end
