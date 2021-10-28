class UserCar
  include ActiveModel::Model
  attr_accessor :nickname, :email, :password, :password_confirmation, :last_name, :first_name, :postal_number, :address, :telephone_number, :car_brand, :car_name, :inspection_date, :car_color, :car_nickname, :car_condition

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :car_brand, presence: true
  validates :car_name, presence: true
  validates :inspection_date, presence: true

  def save
    user = User.create(nickname: nickname, email: email, password: password, password_confirmation: password_confirmation, last_name: last_name, first_name: first_name, postal_number: postal_number, address: address, telephone_number: telephone_number)
    Car.create(car_brand: car_brand, car_name: car_name, inspection_date: inspection_date, car_color: car_color, car_nickname: car_nickname, car_condition: car_condition, user_id: user.id)
  end

end