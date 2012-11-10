class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :cooking_times
      t.integer :favourite
      t.text :guide

      t.timestamps
    end
  end
end
