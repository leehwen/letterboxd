class LibraryController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :update, :search, :results]

  def index

  end

  def show
    @film_library = FilmLibrary.find(params[:id])
  end

  def update
    @film_library = FilmLibrary.find(params[:id])

    @runtime = params[:runtime]

    @genres = params[:genres]
    @genre_names = []

    @genres.each do |genre|
      @genre_names << genre[:name]
    end

    @crew = params[:crew]
    @directors = []

    @crew.each do |crew|
      @directors << crew[:name] if crew[:job] == "Director"
    end

    @cast = params[:cast]
    @acting_cast = []

    @cast.each do |cast|
      @acting_cast << cast[:name] if cast[:known_for_department] == "Acting"
    end

    @film_library.update(runtime: @runtime, genres: @genre_names, directed_by: @directors, cast: @acting_cast)

    respond_to do |format|
      format.html
      format.text { render partial: "film_info", locals: {film_library: @film_library}, formats: [:html] }
    end

  end

  def search
    @query = params[:film]
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
      format.text { render partial: "film_search_results", locals: {results: @results, query: @query}, formats: [:html] }
    end
  end

end
