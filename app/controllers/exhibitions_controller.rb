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
    @resultsExhibition = Result.where(exhibition_id: @exhibition.id)
    @points = Array.new(@resultsExhibition.count)

    i=0
    @points[i]=0
    for t in @resultsExhibition do
      @awards = Result.select(:award_id).where(dog_id: t.dog.id, exhibition_id: t.exhibition.id).distinct
      @points[i] = Point.where(award_id: t.award_id,type_id: t.exhibition.type_id, year: t.exhibition.date.year).sum(:npoint)
      i=i+1
    end
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
