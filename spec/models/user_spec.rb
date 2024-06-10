require 'rails_helper'
RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、lastnameとfirstname、lastname_kanaとfirstname_kana、dateofbirthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = 'a' * 129
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが半角英数字以外は登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end
      it 'password_confirmationが空では登録できない'do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'lastnameが全角文字以外は登録できない' do
        @user.lastname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname Last name is invalid. Input full-width characters")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'firstnameが全角文字以外は登録できない' do
        @user.firstname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname First name is invalid. Input full-width characters")
      end
      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'lastname_kanaが全角カタカナ以外は登録できない' do
        @user.lastname_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana Last name kana is invalid. Input full-width katakana characters")
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'firstname_kanaが全角カタカナ以外は登録できない' do
        @user.firstname_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana First name kana is invalid. Input full-width katakana characters")
      end
      it 'dateofbirthが空では登録できない' do
        @user.dateofbirth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Dateofbirth can't be blank")
      end
    end
  end
end
