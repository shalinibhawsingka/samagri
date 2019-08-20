class StorageController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    if params[:category].present?
      @category = Category.find_by(id: params[:category])
      @items = @category.items
    end
  end
end
