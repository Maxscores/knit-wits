class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:category])
    @items = @category.items.paginate(:page => params[:page], :per_page => 15)
    render "items/index"
  end
end
