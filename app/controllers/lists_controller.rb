class ListsController < ApplicationController

  def index
    @lists = List.all.order(:name)
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
    @bookmark = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :thumbnail)
  end

end
