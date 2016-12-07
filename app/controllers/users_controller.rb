class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def signin
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Account created!"

    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to tasks_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to signin_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
