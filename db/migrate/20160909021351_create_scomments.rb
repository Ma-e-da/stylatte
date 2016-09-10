class CreateScomments < ActiveRecord::Migration
  def change
    create_table :scomments do |t|
      t.integer :user_id
      t.references :post, index: true, foreign_key: true
      t.text :content
# userは、stylingをやったユーザー。postはスタイリングを頼んだユーザーのこと。

      t.timestamps null: false
    end
      add_index :scomments, [:user_id, :created_at]
  end
end
