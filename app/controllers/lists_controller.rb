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
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)

    if @list.save
      redirect_to edit_list_list_film_lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
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

    @list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
