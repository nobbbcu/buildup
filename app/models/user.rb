class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :tweet
  mount_uploader :image, ImageUploader
  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

  validates :name, presence: true
end
