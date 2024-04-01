class LibraryController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :create, :search, :results]

  def index

  end

  def show

  end

  def create

  end

  def search
    @query = params[:film]
  end

  def results
    @results = params[:results]
    @query = params[:query]

    @results.each do |result|
      @film_library =  FilmLibrary.find_or_initialize_by(
        title: result[:original_title]
      )

      @film_library.description = result[:overview]
      @film_library.release_date = result[:release_date]
      @film_library.image_url = "https://image.tmdb.org/t/p/original#{result[:poster_path]}"
      @film_library.tmdb_id = result[:id]
      @film_library.save
    end

    respond_to do |format|
      format.html
      format.text { render partial: "search_films_results", locals: {results: @results, query: @query}, formats: [:html] }
    end
  end

end
