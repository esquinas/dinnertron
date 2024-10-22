class CreateIngredientsRecipesJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :ingredients, :recipes
  end
end
