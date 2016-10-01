class AddColumnsDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer
    add_column :users, :country, :integer
  end
end
