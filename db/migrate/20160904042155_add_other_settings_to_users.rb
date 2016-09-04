class AddOtherSettingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stylist, :varchar
    add_column :users, :country, :varchar
    add_column :users, :picture, :varchar
    add_column :users, :appeal_message, :text
    add_column :users, :sns, :text
    add_column :users, :public, :varchar
    add_column :users, :status, :varchar
    add_column :users, :payment, :varchar
  end
end
