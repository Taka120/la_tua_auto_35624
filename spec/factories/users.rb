FactoryBot.define do
  factory :user do
    nickname {"タロウ"}
    email {Faker::Internet.free_email}
    password {"t12345"}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太朗"}
    postal_number {"123-1234"}
    address {"東京都品川区1-1-1"}
    telephone_number {"123-1234-5678"}
    car_brand {"フィアット"}
    car_name {"500"}
    inspection_date {"2022-10-1"}
    car_color {"白"}
    car_nickname {"Sig.チンクエチェント"}
    car_condition {"良好"}
  end
end