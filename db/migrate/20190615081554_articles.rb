class Articles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :author
      t.datetime :publisheddate
      t.string :url
      t.timestamps
      t.integer :user_id
    end
  end
end
