class ReviewsController < ApplicationController
  def create
    @review_date = params[:date]
    @review_content = params[:review]
    @film = Film.find(params[:film_id])
    @rating = params[:rating]

    @review = Review.new(date: @review_date, review: @review_content, rating: @rating, film_id: @film.id)

    if @review.save
      @film.update(rating: @review.rating)
      respond_to do |format|
        format.json { render json: { head: :ok } }
      end
    else
      respond_to do |format|
        format.json { render json: { head: :ok } }
      end

      errors = []

      @review.errors.full_messages.each do |message|
        errors << message.split.first
      end

      if errors.count == 1
        flash[:alert] = errors.join.capitalize + " can't be blank"
      elsif errors.count == 2
        flash[:alert] = errors.join(' & ').capitalize + " can't be blank"
      elsif errors.count >= 3
        flash[:alert] = errors.join(', ').capitalize + " can't be blank"
      end
    end
  end

  def update
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
    @review_date = params[:date]
    @review_content = params[:review]
    @rating = params[:rating]

    @review.update(date: @review_date, review: @review_content, rating: @rating, film_id: @film.id)

    if @review.save
      @film.update(rating: @review.rating)

      respond_to do |format|
        format.json { render json: { head: :ok } }
      end

      flash[:alert] = "Review has been updated"
    else
      respond_to do |format|
        format.json { render json: { head: :ok } }
      end

      errors = []

      @review.errors.full_messages.each do |message|
        errors << message.split.first
      end

      if errors.count == 1
        flash[:alert] = errors.join.capitalize + " can't be blank"
      elsif errors.count == 2
        flash[:alert] = errors.join(' & ').capitalize + " can't be blank"
      elsif errors.count >= 3
        flash[:alert] = errors.join(', ').capitalize + " can't be blank"
      end
    end
  end
end
