class ResultsController < ApplicationController
  before_filter :authorize_admin!, only: [:edit, :update]
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  def index
    set_user
    @results = Result.where(dog_id: Dog.where(user_id: @user))
    @myResults = 'selected'
    authorize! :index, Result
  end

  def new
    @result = Result.new
    authorize! :new, Result
  end

  def create
    @result = Result.new(result_params)
    if @result.status.blank?
      @result.status = 'Pending'
    end
    authorize! :create, Result
    if @result.save
      ResultMailer.create_result(current_user, @result)
      set_admins
      ResultMailer.create_result_to_admin(current_user, @result, @admins)
      flash[:notice] = "Result has been created. A message with the result's link has been sent to your email address"
      redirect_to Result
    else
      flash[:alert] = 'Result has not been created.'
      render 'new'
    end
  end

  def show
    authorize! :show, Result
  end

  def edit
    authorize! :edit, Result
  end

  def update
    if @result.update_attributes(result_params)
      set_result_user
      ResultMailer.edit_result_by_admin(@user,@result,current_user)
      flash[:notice] = "Result has been updated. A message with the result's link has been sent to user email address"
      redirect_to @result
    else
      flash[:alert] = 'Result has not been updated.'
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, Result
    authenticate_user!
    if @result.status == 'Pending' || @result.status == 'Rejected'
      @result.destroy
      flash[:notice] = "Result has been deleted."
      redirect_to results_path
    elsif current_user.admin? @result.status == 'Validated'
      @result.destroy
      flash[:notice] = "Result has been deleted."
      redirect_to results_path
    else
      flash[:alert] = "Result has not been deleted."
      redirect_to results_path
    end
  end



  private
  def result_params
    params.require(:result).permit(:exhibition_id, :award_id, :dog_id, :status)
  end

  def set_result
    @result = Result.find(params[:id])
  end

  def set_result_user
    @user = User.find(@result.dog_id)
  end

  def set_user
    @user = current_user.id
  end

  def set_admins
    @admins = User.where(admin: 'true')
  end
end
