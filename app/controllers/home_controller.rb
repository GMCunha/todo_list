class HomeController < ApplicationController
  def index
    @lists = List.all
    @items = Item.all
  end
end
