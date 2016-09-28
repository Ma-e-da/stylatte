class AddToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :scomment_user, :integer
    add_column :ratings, :star, :integer

  end
end
