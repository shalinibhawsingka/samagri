class BrandsController < ApplicationController
  before_action :get_brand, only: [:edit, :update, :destroy]
  def index
    @brands = Brand.paginate(page: params[:page], per_page: 5)
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
        redirect_to brands_path, alert: "Brand created successfully."
    else
        render new_brand_path, alert: "Error creating brand."
    end
  end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to(brands_path(@brand), flash: { success: 'Successfully Updated' })
    else
      render 'edit'
    end
  end

  def destroy
    if @brand.destroy
      flash[:notice] = "Successfully deleted!"
      redirect_to brands_path
    else
      flash[:notice] = "Error deleting brand!"
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end

  def get_brand
    @brand = Brand.find(params[:id])
  end
end
