class Public::HomesController < ApplicationController
  def about
  end

  def top
    @item = Item.all
  end
end
