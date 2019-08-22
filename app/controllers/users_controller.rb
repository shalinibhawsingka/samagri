class UsersController < ApplicationController
  before_action :get_user, only: %i[edit update destroy]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, alert: "User created successfully."
    else
      render new_user_path, alert: "Error creating user."
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to(users_path(@user), flash: { success: "Successfully Updated" })
    else
      render "edit"
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "Successfully deleted!"
      redirect_to users_path
    else
      flash[:notice] = "Error deleting user!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_admin)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
