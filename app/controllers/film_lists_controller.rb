class FilmListsController < ApplicationController
  def new
    @film_list = FilmList.new
    @list = List.find(params[:list_id])
    @film_library = FilmLibrary.find(params[:film_library_id])
  end

  def create

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
