class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    # maybe needs to move to :new
    @bookmark = Bookmark.new(bookmark_params)
    @movies = Movie.all


    # @movie = Movie.find(params[:movie_id])
    # @list = Movie.find(params[:list_id])
    # @bookmark.movie_id = @movie
    # @bookmark.list_id = @list

    if @bookmark.save
      redirect_to @bookmark
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to :index
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
