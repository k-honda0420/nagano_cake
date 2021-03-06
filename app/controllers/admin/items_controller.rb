class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
    @genre = Genre.all

  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def update
   @item = Item.find(params[:id])
   @item.update(item_params)
   redirect_to admin_item_path
  end


 private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image)
  end

end
