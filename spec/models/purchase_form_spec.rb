require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@purchase_form).to be_valid
      end
      it '建物名は空でも保存できる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'クレジットカード情報が空だと保存できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では保存できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @purchase_form.postal_code = '1111111'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県の情報が「---」では保存できない' do
        @purchase_form.province_id = '1'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Province can't be blank")
      end
      it '市区町村が空では保存できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @purchase_form.address_line1 = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address line1 can't be blank")
      end
      it '電話番号が空では保存できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと保存できない' do
        @purchase_form.phone_number = '1'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is too short or long')
      end
      it '電話番号が12桁以上だと保存できない' do
        @purchase_form.phone_number = '090123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is too short or long')
      end
      it '電話番号に半角数値以外が含まれると保存できない' do
        @purchase_form.phone_number = '1-1'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'user_idが空だと保存できない' do
        @purchase_form.user_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchase_form.item_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @purchase_form.token = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
