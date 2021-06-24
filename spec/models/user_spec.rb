require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が成功するとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録が失敗するとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'samplesampe.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数混合で入力してください。')
      end
      it 'passwordは全角英数混合では登録できない' do
        @user.password = 'AAA123'
        @user.password_confirmation = 'AAA123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数混合で入力してください。')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが全角で入力されている' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name は全角で入力してください。')
      end
      it 'first_nameが全角で入力されている' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
      end
      it 'family_name_kanaが全角カタカナで入力されている' do
        @user.family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana は全角カタカナで入力して下さい。')
      end
      it 'first_name_kanaが全角カタカナで入力されている' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力して下さい。')
      end
      it 'birthdayが空だと登録出来ない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")  
      end
    end
  end
end