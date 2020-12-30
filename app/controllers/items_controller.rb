class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end


  def create
    @item = @user.items.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:content).merge(user_id: current_user.id)
  end
end
