class Tweet < ApplicationRecord
  validates :title, :text, :category_id, presence: true
  belongs_to :user
  has_many :comments
  has_one_attached :video

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
