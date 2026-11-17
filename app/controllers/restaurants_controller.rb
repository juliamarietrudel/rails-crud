class RestaurantsController < ApplicationController
  # Load the existing record before actions that need an ID from the URL.
  before_action :set_restaurant, only: [ :show, :edit, :update, :destroy ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      # Render keeps the submitted values and validation errors available.
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy!
    # After DELETE, tell Turbo to follow the redirect with a GET request.
    redirect_to restaurants_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    # Strong parameters allow only these form fields to be mass-assigned.
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
