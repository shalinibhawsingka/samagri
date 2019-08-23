class StorageController < ApplicationController
  def index
    if params[:category].present?
      @category = Category.find_by(id: params[:category])
      @items = @category.items.includes(:employee)
    end
  end
end
