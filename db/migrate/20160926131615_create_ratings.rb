class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user, null: false
      t.references :scomment, null: false
      t.timestamps null: false
    end
    add_index :ratings, :user_id
    add_index :ratings, :scomment_id
  end
end
