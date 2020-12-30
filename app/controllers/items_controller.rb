class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end


  def create
    @item = @user.items.new(item_params)
    if @item.save
      redirect_to item_index_path(@index)
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:content).merge(user_id: current_user.id)
  end
end
