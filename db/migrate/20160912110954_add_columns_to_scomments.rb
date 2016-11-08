class AddColumnsToScomments < ActiveRecord::Migration
  def change
    add_column :scomments, :picture, :string
    add_column :scomments, :product_url, :string
  end
end
