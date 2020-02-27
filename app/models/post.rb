class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, length: { maximum: 65_535 }
  validates :youtube_url, presence: true, length: { maximum: 100 }

  def save_posts(tags)
    current_tags = self.tags.pluck(:tag) unless self.tags.nil?
    old_tags = current_tags - tags.split(',')
    new_tags = tags.split(',').uniq - current_tags

    # Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag: old_name)
    end

    # Create
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag: new_name)
      self.tags << post_tag
    end
  end
end
