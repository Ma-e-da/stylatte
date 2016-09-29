class Scomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
# favorites
  has_many :favorites
  has_many :favoriting_users, through: :favorites, source: :user
# ratings
  has_many :ratings
  has_many :users, through: :ratings

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size


  private

  # アップロード画像のサイズを検証する
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
