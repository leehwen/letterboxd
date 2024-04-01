class LibraryController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :create, :search]

  def index

  end

  def show

  end

  def create

  end

  def search
    @query = params[:film]

    @results = params[:results]
    @duplicated_query = params[:query]

    respond_to do |format|
      format.html
      format.text { render partial: "search_films_results", locals: {results: @results, query: @duplicated_query}, formats: [:html] }
    end

  end
end
