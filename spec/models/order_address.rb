require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user, item_id: @item)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'tokenとpostcode、prefecture_id、municipalities、street_address、phone_numberが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameがからでも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

      context '商品購入できないとき' do
        it 'tokenが空では購入できない' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'postcodeが空では購入できない' do
          @order_address.postcode = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
        end 
        it 'postcodeがハイフン無しでは購入できない' do
          @order_address.postcode = '1231111'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
        end
        it 'postcodeにハイフンが複数含まれていると購入できない' do
          @order_address.postcode = '123--4567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
        end
        it 'prefecture_idが空では購入できない' do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end 
        it 'municipalitiesが空では購入できない' do
          @order_address.municipalities = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
        end 
        it 'street_addressが空では購入できない' do
          @order_address.street_address = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Street address can't be blank")
        end 
        it 'phone_numberが空では購入できない' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが12桁以上では購入できない' do
          @order_address.phone_number = '080000000000'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
        end
        it 'phone_numberが半角数字以外では購入できない' do
          @order_address.phone_number = '０８０００００００００'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
        end 
        it 'phone_numberが数字以外を含む場合購入できない' do
          @order_address.phone_number = '080-0000-0000'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
        end
        it 'user_idが存在しない場合購入できない' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが存在しない場合購入できない' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
