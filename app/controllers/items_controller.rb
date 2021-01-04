class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :pay_id, :area_id, :day_id, :price, :user, :image).merge(user_id: current_user.id)
  end
end
 