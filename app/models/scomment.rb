class Scomment < ActiveRecord::Base
  belongs_to :post
  # スタイリストのユーザーIDをとりたいので
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
