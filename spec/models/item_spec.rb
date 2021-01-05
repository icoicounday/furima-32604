require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe 'アイテムの保存' do
    context "アイテムが保存できる場合" do
      it "全ての情報が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    
    context "アイテムが保存できない場合" do
      it "・・・imageが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが空だとアイテムは保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明がないとアイテムは保存できない" do
          @item.text = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "カテゴリーの情報がないとアイテムは保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "・・・カテゴリーの情報は1以外でないと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態の情報がないとアイテムは保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "・・・商品の状態の情報は1以外でないと登録できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      
      it "配送料の負担の情報がないとアイテムは保存できない" do
        @item.pay_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Pay can't be blank")
      end
      it "・・・配送料の負担の情報は1以外でないと登録できない" do
        @item.pay_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Pay can't be blank")
      end
      it "発送元の地域の情報がないとアイテムは保存できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "・・・発送元の地域の情報は1以外でないと登録できない" do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it "発送までの日数の情報がないとアイテムは保存できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "・・・発送までの日数は1以外でないと登録できない" do
        @item.day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it "価格の情報がないとアイテムは保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲がの¥300~¥9,999,999の間でないとアイテムは保存できない" do
        @item.price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が299円以下だと出品できない" do
        @item.price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が10000000円以上だと出品できない" do
        @item.price = "10000001"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格は半角数字のみでないとアイテムは保存できない" do
        @item.price = "てすと"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end