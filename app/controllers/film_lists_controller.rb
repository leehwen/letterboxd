class FilmListsController < ApplicationController
  def new
    @film_list = FilmList.new
    @list = List.find(params[:list_id])
    @url = request.original_url

    @film_library = FilmLibrary.find(params[:film_library_id]) if params[:film_library_id].present?
  end

  def create
    @film_list = FilmList.new
    @film_list.list_id = params[:list_id]
    @existing_film_library = params[:film_library_id]

    if params[:film_library_id].present?
      @film_library = FilmLibrary.find(@existing_film_library)
    elsif params[:tmdb_id].present?
      @film_library = FilmLibrary.find_by(tmdb_id: params[:tmdb_id])
    end

    @film =  Film.find_or_initialize_by(
      film_library_id: @film_library.id
    )

    @film.user = current_user
    @film.save

    @film_list.film_id = @film.id
    @film_list.save

    respond_to do |format|
      format.html
      format.text { render partial: "film_added_to_list", locals: {film_list: @film_list}, formats: [:html] }
    end
  end

  def edit_list
    @list = List.find(params[:list_id])
    @film_lists = @list.film_lists
    @url = request.original_url
  end

  def update
    @list = List.find(params[:list_id])
    @film_list = FilmList.find(params[:id])
    @notes = params[:notes]
    @film_list.update(notes: @notes)

    respond_to do |format|
      format.html
      format.json { render json: { head: :ok } }
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @film_list = FilmList.find(params[:id])
    @film_list.destroy

    respond_to do |format|
      format.html
      format.json { render json: { head: :ok } }
    end
  end

  def results
    @results = params[:results]
    @query = params[:query]

    @results.each do |result|
      @film_library =  FilmLibrary.find_or_initialize_by(
        tmdb_id: result[:id]
      )

      @film_library.title = result[:original_title]
      @film_library.description = result[:overview]
      @film_library.release_date = result[:release_date]
      @film_library.image_url = "https://image.tmdb.org/t/p/original#{result[:poster_path]}"
      @film_library.backdrop_url = "https://image.tmdb.org/t/p/original#{result[:backdrop_path]}"
      @film_library.save
    end

    respond_to do |format|
      format.html
      format.text { render partial: "film_lists_search_results", locals: {results: @results, query: @query}, formats: [:html] }
    end
  end
end
