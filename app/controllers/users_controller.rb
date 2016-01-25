class UsersController < ApplicationController
  before_action :find_user

  def show
    
  end

  def edit
    
  end

  def new
    
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to show_user_path(@user), notice: t('messages.user.update.success')
    else
      flash[:alert] = t('messages.user.update.fail')
      render :edit
    end
  end

  private

  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :username)
  end
end
