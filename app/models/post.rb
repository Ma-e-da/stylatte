class Post < ActiveRecord::Base
  belongs_to :user
  has_many :scomments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size


  # add_column :posts, :picture, :string
  # add_column :posts, :product, :integer     ***
  # add_column :posts, :for_who, :integer     ***
  # add_column :posts, :item_size, :string
  # add_column :posts, :color, :integer       ***
  # add_column :posts, :style_genre, :integer ***
  # add_column :posts, :scene, :integer       ***
  # add_column :posts, :season, :integer      ***
  # add_column :posts, :price_range, :string
  # add_column :posts, :deadline, :datetime

  enum product: { no_choice_product: 0, outerwears: 1, tops: 2, bottoms: 3, dresses: 4, accessories: 5, bags: 6, shoes: 7 }
  enum for_who: { no_choice_whose: 0, man: 1, woman: 2, others: 3 }
  enum color: { no_choice_color: 0, black: 1, grey: 2, green: 3, blue: 4, brown: 5, pink: 6, red: 7, orange: 8, beige: 9, white: 10 }
  enum style_genre: { no_choice_style_genre: 0, cool: 1, cute: 2, simple: 3, classic:4, elegant:5 }
  enum scene: { no_choice_scene: 0, formal: 1, casual: 2 }
  enum season: { no_choice_season: 0, spring: 1, summer: 2, autumn: 3, winter:4 }


  private

  # アップロード画像のサイズを検証する
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
