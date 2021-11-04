require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーが新規登録できる場合' do
     it '必須項目が正しく入力されれば登録できる' do
       expect(@user).to be_valid
     end

     it 'postal_numberが未入力でも登録できる' do
       @user.postal_number = ''
       expect(@user).to be_valid
     end

     it 'addressが未入力でも登録できる' do
       @user.address = ''
       expect(@user).to be_valid
     end

     it 'telephone_numberが未入力でも登録できる' do
       @user.telephone_number = ''
       expect(@user).to be_valid
     end

     it 'car_colorが未入力でも登録できる' do
       @user.car_color = ''
       expect(@user).to be_valid
     end

     it 'car_nicknameが未入力でも登録できる' do
       @user.car_nickname = ''
       expect(@user).to be_valid
     end

     it 'car_conditionが未入力でも登録できる' do
       @user.car_condition = ''
       expect(@user).to be_valid
     end
    end


    context 'ユーザーが新規登録できない場合' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end

     it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
     end
   
     it '重複したemailが存在すると登録できない' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include "Email has already been taken"
     end
  
     it 'emailに@が含まれていないと登録できない' do
       @user.email = 'taroutest.com'
       @user.valid?
       expect(@user.errors.full_messages).to include "Email is invalid"
     end

     it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Password can't be blank"
     end

     it 'passwordが5文字以下では登録できない' do
       @user.password = '12345'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end

     it 'passwordが半角英数混合していないと登録できない(数字のみの場合)' do
       @user.password = '123456'
       @user.password_confirmation = '123456'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is invalid"
     end

     it '全角文字を含むパスワードでは登録できない' do 
       @user.password = '1234tた'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is invalid"
     end

     it 'passwordが半角英数混合していないと登録できない(英字のみの場合)' do
       @user.password = 'abcdef'
       @user.password_confirmation = 'abcdef'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is invalid"
     end

     it 'passwordとpassword_confirmationが一致していないと登録できない' do
       @user.password = 't12345'
       @user.password_confirmation = '12345t'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end

     it 'last_nameが空だと登録できない' do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Last name can't be blank"
     end

     it 'first_nameが空だと登録できない' do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "First name can't be blank"
     end

     it 'car_brandが空だと登録できない' do
       @user.car_brand = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Car brand can't be blank"
     end
     
     it 'car_nameが空だと登録できない' do
       @user.car_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Car name can't be blank"
     end

     it 'inspection_dateが空だと登録できない' do
       @user.inspection_date = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Inspection date can't be blank"
     end
    end
  end
end
