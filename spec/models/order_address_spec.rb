require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @buyer = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @buyer.id)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address,item_id: @item.id, user_id: @user.id)
    sleep(0.1)
  end
  
  describe '購入ができる場合' do
    context "購入できる場合" do
      it "全ての情報が存在すれば登録できる" do
        expect(@order_address).to be_valid
      end

      it "priceとtokenがあれば保存ができること" do
        expect(@order_address).to be_valid
      end
      it "建物名が抜けていても登録できること" do
        building_name= ""
        expect(@order_address).to be_valid
      end
    end
    
    context "購入ができない場合" do
      it "郵便番号が空では登録できない" do
        @order_address.post_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      it "郵便番号に-がないとは登録できない" do
        @order_address.post_number = "3200047"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it "都道府県が空では登録できない" do
        @order_address.area_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it "area_idが0の時登録できない" do
        @order_address.area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it "市区町村が空では登録できない" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空では登録できない" do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end



      it "電話番号が空では登録できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は11桁であること" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は英数混合では登録できないこと" do
        @order_address.phone_number = "a1"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "item_idが空では登録できない" do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "user_idが空では登録できない" do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

    end
  end
end