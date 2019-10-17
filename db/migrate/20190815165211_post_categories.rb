class PostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.integer :post_id
      t.integer :category_id
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
