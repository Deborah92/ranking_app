class ExhibitionsController < ApplicationController
  before_filter :authorize_admin!, except: [:show, :index]
  before_action :set_exhibition, only: [:show, :edit, :update, :destroy]
  def index
    @exhibitions = Exhibition.all
    @allExhibitions = 'selected'
  end

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)

    if @exhibition.save
      flash[:notice] = 'Exhibition has been created.'
      redirect_to @exhibition
    else
      flash[:alert] = 'Exhibition has not been created.'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @exhibition.update_attributes(exhibition_params)
      flash[:notice] = 'Exhibition has been updated.'
      redirect_to @exhibition
    else
      flash[:alert] = 'Exhibition has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @exhibition.destroy
    flash[:notice] = "Exhibition has been deleted."
    redirect_to exhibitions_path
  end



  private
  def exhibition_params
    params.require(:exhibition).permit(:name, :date, :type_id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end
end
