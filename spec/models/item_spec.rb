require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe 'アイテムの保存' do
    context "アイテムが保存できる場合" do
      it "全ての情報が存在すれば登録できる" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
    end
    
    context "アイテムが保存できない場合" do
      it "nameが空だとアイテムは保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の説明がないとアイテムは保存できない" do
          @item.text = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーの情報がないとアイテムは保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態の情報がないとアイテムは保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "配送料の負担の情報がないとアイテムは保存できない" do
        @item.pay_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "発送元の地域の情報がないとアイテムは保存できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "発送までの日数の情報がないとアイテムは保存できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "価格の情報がないとアイテムは保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "価格の範囲がの¥300~¥9,999,999の間でないとアイテムは保存できない" do
        @item.text = "300~9999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "販売価格は半角数字のみでないとアイテムは保存できない" do
        @item.price = "てすと"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end