class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    authorize! :new, @user
  end

  def create
    @user = User.new(user_params)
    authorize! :create, @user

    if @user.save
      flash[:notice] = 'User has been created.'
      redirect_to @user
    else
      flash[:alert] = 'User has not been created.'
      render 'new'
    end
  end

  def show
    @userdogs = @user.dogs.where("user_id = ?", @user.id)
  end

  def edit
    authorize! :edit, @user
  end

  def update
    authorize! :update, @user
    if @user.update_attributes(user_params)
      flash[:notice] = 'User has been updated.'
      redirect_to @user
    else
      flash[:alert] = 'User has not been updated.'
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, @user
    @user.destroy
    flash[:notice] = "User has been deleted."
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
