class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_index_path
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:image_id, :name, :introduction, :price)
  end

end