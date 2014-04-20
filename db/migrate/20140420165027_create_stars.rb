class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|

      t.timestamps
    end
  end
end
