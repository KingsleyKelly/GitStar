class CreateStarPosts < ActiveRecord::Migration
  def change
    create_table :star_posts do |t|
      t.integer :star
      t.string :name
      t.string :url
      t.string :avatar
      t.date :updated_at
      t.string :language
      t.string :likes, array: true
      t.timestamps
    end
  end
end
