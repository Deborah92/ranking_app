class Admin::ResultsController < ApplicationController
  before_filter :authorize_admin!, except: [:show]
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)

    if @result.save
      flash[:notice] = 'Result has been created.'
      redirect_to @result
    else
      flash[:alert] = 'Result has not been created.'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @result.update_attributes(result_params)
      set_result_user
      ResultMailer.edit_result_by_admin(@user,@result)
      flash[:notice] = "Result has been updated. A message with the result's link has been sent to user email address"
      redirect_to @result
    else
      flash[:alert] = 'Result has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @result.destroy
    flash[:notice] = "Result has been deleted."
    redirect_to results_path
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
end