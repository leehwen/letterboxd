class LibraryController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :create, :search ]

  def index

  end

  def show

  end

  def create

  end

  def search
    @query = params[:film]
  end

end
