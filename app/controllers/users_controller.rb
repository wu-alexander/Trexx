class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update ]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :age)
  end

  def set_user
    @user = current_user
    authorize @user
  end
end
