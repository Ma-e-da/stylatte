class AddIndexToRatings < ActiveRecord::Migration
  def change
    
    add_index :ratings, :scomment_user
    add_index :ratings, [:user_id, :scomment_id]
    add_index :ratings, [:user_id, :scomment_user]
    add_index :ratings, [:scomment_user, :star]

  end
end
