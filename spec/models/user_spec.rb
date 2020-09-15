require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録が上手くいく時' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,first_name_reading,last_name_reading,birthdayが全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailにドメインが存在すれば保存できる' do
        @user.email = '123@456'
        expect(@user).to be_valid
      end
      it 'passwordがアルファベットと数字が存在して8文字以上であれば登録できる' do
        @user.password = '1a2b3c4d'
        @user.password_confirmation = '1a2b3c4d'
        expect(@user).to be_valid
      end
      it 'first_nameが全角文字の平仮名もしくはカタカナもしくは漢字の場合は保存できる' do
        @user.first_name = '吉田'
        expect(@user).to be_valid
      end
      it 'last_nameが全角文字の平仮名もしくはカタカナもしくは漢字の場合は保存できる' do
        @user.last_name = 'さくじ'
        expect(@user).to be_valid
      end
      it 'first_name_readingが全角カタカナの場合保存できる' do
        @user.first_name_reading = 'ヨシダ'
        expect(@user).to be_valid
      end
      it 'last_name_readingが全角カタカナの場合保存できる' do
        @user.last_name_reading = 'サクジ'
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない'do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password = "12356789a"
        @user.password_confirmation = "123456789b"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'last_name_readingが空だと登録できない' do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordに数字とアルファベットがないと登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'last_nameが全角でなければ登録できない' do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it 'first_name_readingが全角カタカナでなければ登録できない' do
        @user.first_name_reading = "ありよし"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters")
      end
      it 'last_name_readingが全角カタカナ出なければ登録できない' do
        @user.last_name_reading = "はやと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters")
      end
    end
  end
end
