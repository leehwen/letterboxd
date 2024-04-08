class ListsController < ApplicationController
  def index

  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @film_library_id = params[:new_list][:film_library_id]
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @film_library_id = params[:list][:film_library_id]

    if @list.save
      redirect_to new_list_film_list_path(@list, film_library_id: "#{@film_library_id}")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
