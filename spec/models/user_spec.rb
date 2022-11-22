require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it '全てが空でなく、指定の文字を使用していれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it '重複したアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end

      it 'emailに@がないと登録できない' do
        @user.email = '123456gmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = '123aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it '英文字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あ123aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（全角）を入力してください")
      end

      it 'first_nameが全角以外では登録できない' do
        @user.first_name = 'ee'
        @user.valid?
        expect(@user.errors.full_messages).to include("名（全角）は不正な値です")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（全角）を入力してください")
      end

      it 'last_nameが全角以外では登録できない' do
        @user.last_name = 'ee'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（全角）は不正な値です")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
      end

      it 'first_name_kanaがカナ以外では登録できない' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）は不正な値です")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
      end

      it 'last_name_kanaがカナ以外では登録できない' do
        @user.last_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）は不正な値です")
      end

      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end


