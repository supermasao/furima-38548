require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

 
  describe "ユーザー新規登録" do

    context 'ユーザ登録ができる時' do
    
      it "ユーザーが登録できる時" do 
      @user.valid?
    end


    context 'ユーザ登録ができない時' do
    
      it "nicknameが空だと登録できない" do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "emailが空では登録できない" do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    

    it "重複したアドレスは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "emailに@がないと登録できない" do
      @user.email = '123456gmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it "passwordが空では登録できない" do
      @user.password = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字未満では登録できない" do
      @user.password = '123aa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "英文字のみのパスワードでは登録できない" do
      @user.password = 'aaaaaa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "数字のみのパスワードでは登録できない" do
      @user.password = '123456' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "全角文字を含むパスワードでは登録できない" do
      @user.password = 'あ123aa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが全角以外では登録できない" do
      @user.first_name = 'ee' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが全角以外では登録できない" do
      @user.last_name = 'ee' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaがカナ以外では登録できない" do
      @user.first_name_kana = 'あああ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "last_name_kanaがカナ以外では登録できない" do
      @user.last_name_kana = 'ああ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    
    it "birth_dayが空では登録できない" do
      @user.birth_day = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
end
end

# user = User.new(nickname: "de", email: "ggg@gmail.com", password: "ggg111", password_confirmation: "ggg111",first_name:"だ",last_name:"だ",first_name_kana:"ダ",last_name_kana:"ダ",birth_day:"1930-01-01")