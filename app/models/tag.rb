class Tag < ApplicationRecord
  before_validation :delete_whitespace

  has_many :tagmaps, dependent: :destroy
  has_many :posts, through: :tagmaps
  validates :tag, uniqueness: true

  private

  def delete_whitespace
    self.tag = tag.strip
  end
end
