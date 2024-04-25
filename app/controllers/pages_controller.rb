class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @film_library = FilmLibrary.where.not(image_url: "https://image.tmdb.org/t/p/original")
    @reviews = Review.all
  end
end
