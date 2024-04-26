class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(user1: current_user).or(Chatroom.where(user2: current_user))
  end

  def show
    @chatrooms = Chatroom.where(user1: current_user).or(Chatroom.where(user2: current_user))
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new(user1: current_user, user2_id: params[:chatroom][:user2_id])
    @chatroom.save

    redirect_to chatroom_path(@chatroom)
  end
end
