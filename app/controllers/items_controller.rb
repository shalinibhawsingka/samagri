class ItemsController < ApplicationController
  def index
    @items = Item.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @item = Item.new
    @post = @item.posts.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @category = @item.category
      if !params[:item][:post].blank? 
        params[:item][:post]['image_or_pdf'].each do |img|
          @photo = @item.posts.create!(:image_or_pdf => img)
        end
      end
      
      flash[:success] = "#{@item.name} is Created Successfully!"
      redirect_to items_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    @posts = @item.posts
  end

  def edit
    @item = Item.find(params[:id])
    @item.posts.build unless @item.posts.any?
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      if params[:item][:post].present? 
        params[:item][:post]['image_or_pdf'].each do |img|
          @photo = @item.posts.create(image_or_pdf: img)
        end
      end

      flash[:success] = "#{@item.name} is Updated Successfully!"
      redirect_to items_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "Successfully deleted!"
      redirect_to items_path
    else
      flash[:notice] = "Error deleting employee!"
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :brand_id, :category_id, :employee_id, :status, :notes, post_attributes: [:image_or_pdf])
  end
end
