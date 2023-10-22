class Tweet < ApplicationRecord
  validates :title, :text, presence: true
  belongs_to :user
  has_many :comments
  has_one_attached :video

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
