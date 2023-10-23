class Comment < ApplicationRecord
  belongs_to :tweet  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  has_one_attached :video
end