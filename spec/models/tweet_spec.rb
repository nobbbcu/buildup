require 'rails_helper'
describe Tweet do
  describe '#create' do
    context "save可能" do
      it "全カラム(content, image, hour, user_id)が存在すれば登録できる" do
        tweet = build(:tweet)
        expect(tweet).to be_valid
      end
      
      it "imageが空でも登録できる" do
        tweet = build(:tweet, image: nil)
        expect(tweet).to be_valid
      end
      
      it "hourが空でも登録できる" do
        tweet = build(:tweet, hour: nil)
        expect(tweet).to be_valid
      end
      
      it "image, hourが空でも登録できる" do
        tweet = build(:tweet, image: nil, hour: nil)
        expect(tweet).to be_valid
      end
    end
  
    context "save不可" do
      it "contentが空では登録できない" do
        tweet = build(:tweet, content: "")
        tweet.valid?
        expect(tweet.errors[:content]).to include("can't be blank")
      end
      
      it "user_idが空では登録できない" do
        tweet = build(:tweet, user_id: nil)
        tweet.valid?
        expect(tweet.errors[:user]).to include("must exist")
      end
    end
  end
end