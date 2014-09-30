class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @userdogs = @user.dogs.where("user_id = ?", @user.id)
  end

  def edit
    authorize! :edit, @user
  end

  def update
    authorize! :update, @user
    if @user.update_attributes(dog_params)
      flash[:notice] = 'User has been updated.'
      redirect_to @user
    else
      flash[:alert] = 'User has not been updated.'
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:dog).permit(:email, :encrypted_password)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
