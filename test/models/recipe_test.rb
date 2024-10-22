require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  setup do
    @recipe = Recipe.new(
      author: "bob",
      cook_duration: 0.minutes,
      ingredient_list: ["1 glass of water"],
      prep_duration: 1.minute,
      title: "Water",
    )
  end

  test "stores required attributes" do
    assert_equal "bob", @recipe.author
    assert       @recipe.cook_duration.zero?
    assert_equal 1, @recipe.ingredient_list.size
    assert_equal "1 glass of water", @recipe.ingredient_list.first
    assert_equal 1.minute, @recipe.prep_duration
    assert_equal "Water", @recipe.title
  end

  test "is invalid when required attributes are not present" do
    @recipe.cook_duration = nil
    @recipe.ingredient_list = []
    @recipe.prep_duration = nil
    @recipe.title = ""
    assert_predicate @recipe, :invalid?
    assert @recipe.errors[:cook_duration].any?
    assert @recipe.errors[:ingredient_list].any?
    assert @recipe.errors[:prep_duration].any?
    assert @recipe.errors[:title].any?
  end
end
