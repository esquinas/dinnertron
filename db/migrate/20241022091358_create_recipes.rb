class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :author, null: true
      t.string :category, null: true
      t.interval :cook_duration
      t.string :cuisine, null: true
      t.string :image, null: true
      t.string :ingredient_list, array: true
      t.interval :prep_duration
      t.float :rating, null: true
      t.string :title

      t.timestamps
    end
  end
end
