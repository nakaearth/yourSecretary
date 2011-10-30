class BooksController < AbstractPcController
  def show
    @user = current_user
    @book=Book.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    current_user
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to(:action=>'index',:controller=>'my_page') }
      format.xml  { head :ok }
    end
  end

end
