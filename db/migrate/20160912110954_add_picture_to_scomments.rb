class AddPictureToScomments < ActiveRecord::Migration
  def change
    add_column :scomments, :picture, :string
  end
end
