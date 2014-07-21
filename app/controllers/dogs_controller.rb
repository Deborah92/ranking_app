class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!, except: [:index, :show]
  before_filter :set_user, only: [:new, :edit, :create]
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = @user.dogs.build(dog_params)
    if @dog.save
      flash[:notice] = 'Dog has been created.'
      redirect_to @dog
    else
      flash[:alert] = 'Dog has not been created.'
      render 'new'
    end
  end

  def show
  end

  def edit
    authorize! :edit, @dog
  end

  def update
    if @dog.update_attributes(dog_params)
      flash[:notice] = 'Dog has been updated.'
      redirect_to @dog
    else
      flash[:alert] = 'Dog has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @dog.destroy
    flash[:notice] = "Dog has been deleted."
    redirect_to dogs_path
  end

  private
    def dog_params
      params.require(:dog).permit(:sex, :titles, :name, :birth_date)
    end

    def set_dog
      @dog = Dog.find(params[:id])
    end

    def set_user
      @user = current_user
    end
end
