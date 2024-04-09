class ListsController < ApplicationController
  def index

  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @film_library_id = params[:new_list][:film_library_id] if params[:new_list].present?
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @film_library_id = params[:list][:film_library_id] if params[:list].present?

    if @list.save
      redirect_to new_list_film_list_path(@list, film_library_id: @film_library_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  def cancel
    @list = List.find(params[:id])
    @film_library = FilmList.find_by(list_id: params[:id]).film.film_library
    redirect_to library_path(@film_library)

    # if params[:list_id].present?
    #   @list = List.find(params[:list_id])
    #   @film_library = FilmList.find_by(list_id: params[:list_id]).film.film_library
    # elsif params[:id].present?

    # end

    @list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
