require 'rails_helper'
describe OrderAddress do
  before do
    @orderaddress = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入が上手くいく時' do
      it 'token,postcode,prefecture_id,city,house_number,phone_numberが全て存在すれば購入できる' do
        expect(@orderaddress).to be_valid
      end
      it 'postcodeがハイフンありであれば購入できる' do
        @orderaddress.postcode = '123-4568'
        expect(@orderaddress).to be_valid
      end
      it 'prefecture_idが1出なければ購入できる' do
        @orderaddress.prefecture_id = '4'
        expect(@orderaddress).to be_valid
      end
      it 'phone_numberにハイフンがなければ購入できる' do
        @orderaddress.phone_number = '12345678910'
        expect(@orderaddress).to be_valid
      end
    end

    context '商品購入が上手くいかない時' do
      it 'tokenが空であると購入できない' do
        @orderaddress.token = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Token can't be blank")
      end
      it 'postcodeが空であると購入できない' do
        @orderaddress.postcode = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'prefecture_idが1であると購入できない' do
        @orderaddress.prefecture_id = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空であると購入できない' do
        @orderaddress.city = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空であると購入できない' do
        @orderaddress.house_number = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空であると購入できない' do
        @orderaddress.phone_number = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postcodeにハイフンがないと購入できない' do
        @orderaddress.postcode = "1234567"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postcode Input correctory")
      end
      it 'phone_numberにハイフンがあると購入できない' do
        @orderaddress.phone_number = "123-4567-4567"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number Input correctory")
      end
    end
  end
end
