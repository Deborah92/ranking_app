class ResultsController < ApplicationController
  #before_filter :authorize_admin!, except: [:show, :index]
  before_action :set_result, only: [:show, :destroy]
  def index

    set_user
    @results = Result.where(dog_id: Dog.find_all_by_user_id(@user))
    authorize! :index, Result
  end

  def new
    @result = Result.new
    authorize! :new, Result
  end

  def create
    @result = Result.new(result_params)
    authorize! :create, Result
    if @result.save
      flash[:notice] = 'Result has been created.'
      redirect_to Result
    else
      flash[:alert] = 'Result has not been created.'
      render 'new'
    end
  end

  def show
    authorize! :show, Result
  end

  def destroy
    authorize! :destroy, Result
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

  def set_user
    @user = current_user.id
  end
end
