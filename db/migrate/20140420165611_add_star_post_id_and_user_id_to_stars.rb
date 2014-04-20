class AddStarPostIdAndUserIdToStars < ActiveRecord::Migration
  def change
    add_column :stars, :star_post_id, :integer
    add_column :stars, :user_id, :integer
  end
end
