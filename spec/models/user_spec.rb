require 'rails_helper'
describe User do
  describe '#create' do
    context "save可能" do
      it "全カラム(name, email, password, password_confirmation, image, introduction)が存在すれば登録できる" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "imageが空でも登録できる" do
        user = build(:user, image: nil)
        expect(user).to be_valid
      end

      it "introductionが空でも登録できる" do
        user = build(:user, introduction: nil)
        expect(user).to be_valid
      end
      
      it "image, introductionが空でも登録できる" do
        user = build(:user, image: nil, introduction: nil)
        expect(user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user).to be_valid
      end
    end
  
    context "save不可" do
      it "nameが空では登録できない" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "emailが空では登録できない" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "passwordが空では登録できない" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "重複したemailが存在する場合登録できない" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
      
      it "Passwordが5文字以下であれば登録できない" do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
    end
  end
end