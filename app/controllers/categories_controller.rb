class CategoriesController < ApplicationController
  before_action :get_category, only: %i[edit update destroy]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, alert: "Category created successfully."
    else
      render new_category_path, alert: "Error creating category."
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to(categories_path(@category), flash: { success: "Successfully Updated" })
    else
      render "edit"
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "Successfully deleted!"
      redirect_to categories_path
    else
      flash[:notice] = "Error deleting category!"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :buffer, :min_quan)
  end

  def get_category
    @category = Category.find(params[:id])
  end
end
