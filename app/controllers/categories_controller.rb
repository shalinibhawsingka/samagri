class CategoriesController < ApplicationController

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
        redirect_to new_category_path, alert: "Error creating category."
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to(categories_path(@category), flash: { success: 'Successfully Updated' })
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
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
end
