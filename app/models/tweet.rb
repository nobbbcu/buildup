class Tweet < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :tweet
  mount_uploader :image, ImageUploader

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('content LIKE(?)', "%#{search}%")
  end
end
