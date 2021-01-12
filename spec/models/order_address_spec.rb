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
        # binding.pry
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
        @order_address.post_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      it "都道府県が空では登録できない" do
        @order_address.area_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank", "Area can't be blank")
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



      it "電話番号がからでは登録できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は11桁であること" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end