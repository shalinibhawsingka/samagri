class BrandsController < ApplicationController
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
        redirect_to new_brand_path, alert: "Error creating brand."
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      redirect_to(brands_path(@brand), flash: { success: 'Successfully Updated' })
    else
      render 'edit'
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
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
end
