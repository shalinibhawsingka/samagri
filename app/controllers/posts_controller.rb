class PostsController < ApplicationController
  def destroy
    @item = Item.find(params[:item_id])
    @post = Post.find(params[:id]).destroy
    redirect_to item_path(@item, @post)
  end
end
