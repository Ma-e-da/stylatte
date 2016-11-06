class AddProductUrlToScomments < ActiveRecord::Migration
  def change
    add_column :scomments, :product_url, :string
  end
end
