class FilmsController < ApplicationController
  def new

  end

  def create
    @film_library = FilmLibrary.find(params[:library_id])

    @film =  Film.find_or_initialize_by(
      film_library_id: @film_library.id
    )

    @film.user = current_user
    @film.save

    respond_to do |format|
      format.json { render json: { film: @film } }
    end
  end

  def update
    @film = Film.find(params[:id])
    @update_type = params[:update_type]

    if @update_type == "watch"

      if @film.watched
        @film.update(watched: false)
      else
        @film.update(watched: true)
        if @film.watchlist
          @film.update(watchlist: false)
        end
      end

      respond_to do |format|
        format.json { render json: { head: :ok } }
      end

    elsif @update_type == "like"

      if @film.like
        @film.update(like: false)
      else
        @film.update(like: true)
      end

      respond_to do |format|
        format.json { render json: { head: :ok } }
      end

    elsif @update_type == "watchlist"

      if @film.watchlist
        @film.update(watchlist: false)
      else
        @film.update(watchlist: true)
      end

      respond_to do |format|
        format.json { render json: { head: :ok } }
      end

    elsif @update_type == "rating"
      @rating = params[:rating].to_i
      @film.update(rating: @rating)

      respond_to do |format|
        format.json { render json: { head: :ok } }
      end
    end
  end
end
