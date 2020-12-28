require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "ニックネームが必須であること" do
      expect(@user).to be_valid
      by
    end
    it "メールアドレスが必須であること" do
      @user.name = "aaaaaa"
      expect(@user).to be_valid
    end
    it "メールアドレスが一意性であること" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      expect(@user).to be_valid
    end
    it "メールアドレスは、@を含む必要があること" do
    end
    it "パスワードが必須であること" do
    end
    it "パスワードは、6文字以上での入力が必須であること" do
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
    end
    it "パスワードは、確認用を含めて2回入力すること" do
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
    end
  end
end