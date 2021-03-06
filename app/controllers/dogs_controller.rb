class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_filter :set_user, only: [:new, :edit, :create, :update, :destroy]
  def index
    @theDogs = 'selected'
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
    authorize! :new, @dog
  end

  def create
    # @dog = @user.dogs.build(dog_params)
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    authorize! :create, @dog

    if @dog.save
      flash[:notice] = 'Dog has been created.'
      redirect_to @dog
    else
      flash[:alert] = 'Dog has not been created.'
      render 'new'
    end
  end

  def show
    set_user
    @results = Result.where(dog_id: Dog.where(id: @dog.id))
    @points = Array.new(@results.count)

    i=0
      @points[i]=0
      for t in @results do
        @awards = Result.select(:award_id).where(dog_id: @dog.id, exhibition_id: t.exhibition.id).distinct
        @points[i] = Point.where(award_id: t.award_id,type_id: t.exhibition.type_id, year: t.exhibition.date.year).sum(:npoint)
        i=i+1
      end
  end

  def edit
    authorize! :edit, @dog
  end

  def update
    authorize! :update, @dog
    if @dog.update_attributes(dog_params)
      flash[:notice] = 'Dog has been updated.'
      redirect_to @dog
    else
      flash[:alert] = 'Dog has not been updated.'
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, @dog
    @dog.destroy
    flash[:notice] = "Dog has been deleted."
    redirect_to dogs_path
  end

  def ranking
    @dogs = Dog.all
    @points = Hash.new

    @dogs.each do |d|
      @results = Result.select(:award_id, :exhibition_id).where(dog_id: d.id, status: "Validated").distinct
      @points[d.name]=0
      for t in @results do
        @awards = Result.select(:award_id).where(dog_id: d.id, exhibition_id: t).distinct
        @points[d.name] = @points[d.name]+ Point.where(award_id: t.award_id,type_id: t.exhibition.type_id, year: t.exhibition.date.year).sum(:npoint)
      end
      @points[d.name] = [@points[d.name], d.image, d.sex, d.id]
    end
    @points =@points.sort_by{|a, b| b[0]}.reverse
  end

  private
    def dog_params
      params.require(:dog).permit(:sex, :titles, :name, :birth_date, :image)
    end

    def set_dog
      @dog = Dog.find(params[:id])
    end

    def set_user
      @user = current_user
    end
end
