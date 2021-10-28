class CarsController < ApplicationController
  def index
  end
 
  def new 
    @user_car = UserCar.new
  end
 
  def create
    @car = Car.new(car_params)  
     if @car.valid?
       @car.save
       redirect_to action: :index
     else
       render action: :new
     end
  end
 
  private
  def car_params
   params.require(:user_car).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :postal_number, :address, :telephone_number, :car_brand, :car_name, :inspection_date, :car_color, :car_nickname, :car_condition).merge(user_id: current_user.id)
  end
end
