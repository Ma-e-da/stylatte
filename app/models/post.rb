class Post < ActiveRecord::Base
  belongs_to :user
  has_many :scomments
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size

  self.per_page = 12

  private

  # アップロード画像のサイズを検証する
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
