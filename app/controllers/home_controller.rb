class HomeController < ApplicationController
  def index
    @lists = List.all
    @items = Item.all
  end
  
  def clear_lists
    List.left_outer_joins(:items).where(items: { id: nil }).destroy_all
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  def clear_items
    Item.where(marked: true).destroy_all
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
