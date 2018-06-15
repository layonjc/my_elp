class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :caption
      t.string :image
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps

    end
  end
end
