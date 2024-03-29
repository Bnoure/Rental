class BookingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @bookings = @user.bookings
    @prices = @bookings.map do |booking|
      start_date = booking.starts_at
      end_date = booking.ends_at
      car = booking.car
      calculate_price(start_date, end_date, car)
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @start_date = @booking.starts_at
    @end_date = @booking.ends_at
    @car = @booking.car
    @price = calculate_price(@start_date, @end_date, @car)
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
    @booking.car = @car
    return unless params[:starts_date] && params[:ends_date]

    @booking.starts_at = Date.strptime(params[:booking][:starts_at], "%Y-%m-%d")
    @booking.ends_at = Date.strptime(params[:booking][:ends_at], "%Y-%m-%d")
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to user_bookings_path(current_user), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_bookings_path(current_user), notice: 'Booking was successfully destroyed.'
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :car_id)
  end

  def calculate_price(starts_at, ends_at, car)
    (ends_at.to_date - starts_at.to_date).to_i * car.price_per_day
  end
end
