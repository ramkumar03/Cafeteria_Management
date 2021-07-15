class MenuItemsController < ApplicationController
  def index
    menu_item = MenuItem.all.map { |item| item.to_menu }.join("\n")
    render plain: menu_item
  end
end
