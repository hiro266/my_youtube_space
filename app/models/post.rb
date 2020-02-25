class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, length: { maximum: 65_535 }
  validates :youtube_url, presence: true, length: { maximum: 100 }
end
