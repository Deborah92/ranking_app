class UsersController < ApplicationController
  before_filter :authorize_admin!, except: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, @users
    @users = User.all
  end

  def new
    authorize! :new, @user
    @user = User.new

  end

  def create
    authorize! :create, @user
    @user = User.new(user_params)
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
    if current_user.id == @user.id
      @myProfile = 'selected'
    end
  end

  def edit
    authorize! :edit, @user
  end

  def update
    authorize! :update, @user
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
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
    redirect_to users_index_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :image)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
