class Admin::UsersController < ApplicationController
  before_filter :authorize_admin!, except: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @adminUsers = 'selected'
    @users = User.all

  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if user_params[:admin]=='1'
      @user.admin = 'true'
    else
      @user.admin = 'false'
    end

    if user_params[:cahoot]=='1'
      @user.cahoot = 'true'
    else
      @user.cahoot = 'false'
    end

    if @user.save
      flash[:notice] = 'User has been created.'
      redirect_to admin_users_path
    else
      flash[:alert] = 'User has not been created.'
      render 'new'
    end
  end

  def show
    @userdogs = @user.dogs.where("user_id = ?", @user.id)
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    set_admin
    set_cahoot
    if @user.update_attributes(user_params)
      flash[:notice] = 'User has been updated.'
      redirect_to admin_user_path
    else
      flash[:alert] = 'User has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @user == current_user
      flash[:alert] = "You cannot delete yourself"
    else
      @user.destroy
      flash[:notice] = "User has been deleted."
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin, :image, :cahoot)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_admin
    @user.admin = params[:user][:admin] == "1"
  end
  def set_cahoot
    @user.cahoot = params[:user][:cahoot] == "1"
  end

end
