class UserBadges < ActiveRecord::Migration
  def change
    create_table :user_badges do |t|
      t.integer :badge_id
      t.integer :user_id
      t.timestamps
    end

    create_table :badges do |t|
      t.string :name
      t.timestamps
    end
  end
end