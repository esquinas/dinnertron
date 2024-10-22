require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase
  setup do
    @recipe = recipes(:one)
  end

  test "visiting the index" do
    visit recipes_url
    assert_selector "h1", text: "Recipes"
  end

  test "should show a recipe" do
    visit recipe_url(@recipe)
    assert_selector "h3", text: "Golden Sweet Cornbread"
  end
end
