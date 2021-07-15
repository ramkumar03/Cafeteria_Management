class MenuCategoriesController < ApplicationController
  def index
    menu_category = MenuCategory.all.map { |item| item.to_category }.join("\n")
    render plain: menu_category
  end
end
