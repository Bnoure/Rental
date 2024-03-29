class CarsController < ApplicationController
  before_action :set_search_params_and_dates, only: [:index]

  def index
    @cars = Car.all
    @booking = Booking.new

    return unless params[:search]

    @search_params = search_params.to_h
    if @search_params[:starts_date]
      @search_params[:starts_date], @search_params[:ends_date] = @search_params[:starts_date].split(' to ')
    end

    @cars = @cars.where(city: @search_params[:city]) if @search_params[:city].present?
    @cars = @cars.where(model: @search_params[:model]) if @search_params[:model].present?
    @cars = @cars.where(brand: @search_params[:brand]) if @search_params[:brand].present?
    session[:search] = @search_params
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
    @start_date = params[:start_date] || session[:search][:starts_date]
    @end_date = params[:end_date] || session[:search][:ends_date]
    @search_params = params[:search] || {}
  end
  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to my_cars_path
  end

  def my_cars
    if user_signed_in?
      @my_cars = current_user.cars || []
    else
      redirect_to new_user_session_path
    end
  end

  private

  def set_search_params_and_dates
    return unless params[:search]

    @search_params = search_params.to_h
    if @search_params[:start_date]
      start_date, end_date = @search_params[:start_date].split(' to ')
      @search_params[:starts_date] = Date.strptime(start_date, "%d-%m-%Y") if start_date
      @search_params[:ends_date] = Date.strptime(end_date, "%d-%m-%Y") if end_date
      @start_date = @search_params[:starts_date]
      @end_date = @search_params[:ends_date]
    end
    session[:search] = @search_params
  end

  def search_params
    params.require(:search).permit(:city, :model, :brand, :start_date)
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year_of_production, :address, :price_per_day, :city, :photo)
  end
end
