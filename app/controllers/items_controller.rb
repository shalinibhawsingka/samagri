class ItemsController < ApplicationController
  before_action :get_item, only: [:show, :edit, :update, :destroy]
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
      if @category.items.size <= @category.buffer && @category.items.size > @category.min_quan
        @notification = Notification.create(name:"Please, add some more!.", priority: false)
        ActionCable.server.broadcast 'web_notifications_channel', notification: @notification.name, count: Notification.all.count
      end
      if @category.items.size <= @category.min_quan
        @notification = Notification.create(name:"Please, add more items as soon as possible.", priority: true)
        ActionCable.server.broadcast 'web_notifications_channel', notification: @notification.name, count: Notification.all.count
      end
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
    @posts = @item.posts
  end

  def edit
    @item.posts.build unless @item.posts.any?
  end

  def update
    if ((@item.status != item_params[:status]) && (@item.status==true))
      @category = @item.category
      count = @category.items.count
      count = count - 1
      if count <= @category.buffer && count > @category.min_quan
        @notification = Notification.create(name:"Please, add some more!.", priority: false)
        ActionCable.server.broadcast 'web_notifications_channel', notification: @notification.name, count: Notification.all.count
      end
      if count <= @category.min_quan
        @notification = Notification.create(name:"Please, add more items as soon as possible.", priority: true)
        ActionCable.server.broadcast 'web_notifications_channel', notification: @notification.name, count: Notification.all.count
      end
    end
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

  def get_item
    @item = Item.find(params[:id])
  end
end
