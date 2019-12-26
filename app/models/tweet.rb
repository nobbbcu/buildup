class Tweet < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('content LIKE(?)', "%#{search}%")
  end
end
