class ResultsController < ApplicationController
  before_filter :authorize_admin!, only: [:edit, :update]
  before_action :set_result, only: [:show, :edit, :update, :destroy]


  def index
    set_user
    @results = Result.where(dog_id: Dog.where(user_id: @user))
    @dogs = Dog.where(user_id: @user)
    @points = Array.new(@dogs.count)

    i=0
    @dogs.each do |d|
      @points[i]=0
      for t in @results do
        @awards = Result.select(:award_id).where(dog_id: d.id, exhibition_id: t.exhibition.id).distinct
        @points[i] = Point.where(award_id: t.award_id,type_id: t.exhibition.type_id, year: t.exhibition.date.year).sum(:npoint)
        i=i+1
      end
    end
    @myResults = 'selected'
    authorize! :index, Result
  end

  def new
    @result = Result.new
    @exhib = params[:exhibition_id]
    authorize! :new, Result
  end

  def create
    @result = Result.new(result_params)
    @exhib = params[:exhibition]
    if @result.status.blank?
      @result.status = 'Pending'
    end
    authorize! :create, Result
    if @result.save
      ResultMailer.create_result(current_user, @result).deliver
      set_admins
      ResultMailer.create_result_to_admin(current_user, @result, @admins).deliver
      flash[:notice] = "Result has been created. A message with the result's link has been sent to your email address"
      redirect_to results_path
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
      #set_result_user
      #@owner = Dog.where(id: @result.dog_id).select(:user_id)
      #@user = User.find(@owner.select(:user_id))
      ResultMailer.edit_result_by_admin(current_user,@result).deliver
      flash[:notice] = "Result has been updated. A message with the result's link has been sent to user email address"
        redirect_to results_path
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
      if current_user.admin?
        redirect_to admin_results_path
      else
        redirect_to results_path
      end
    elsif current_user.admin? @result.status == 'Validated'
      @result.destroy
      flash[:notice] = "Result has been deleted."
      redirect_to admin_results_path
    else
      flash[:alert] = "Result has not been deleted."
      redirect_to results_path
    end
  end

  def filtrado
    @result = Result.new
    @points = Point.search(params).select(:award_id)
    @selected = params[:exhibition]
    respond_to do |format|
      format.js
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
