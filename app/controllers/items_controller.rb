class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end


  # def create
  #   @item = @room.messages.new(message_params)
  #   @item.save
  # end

  # private

  # def message_params
  #   params.require(:message).permit(:content).merge(user_id: current_user.id)
  # end
end
