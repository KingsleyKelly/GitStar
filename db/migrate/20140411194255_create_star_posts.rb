class CreateStarPosts < ActiveRecord::Migration
  def change
    create_table :star_posts do |t|
      t.integer :star
      t.string :name

      t.timestamps
    end
  end
end
