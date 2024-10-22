require "test_helper"

class Recipe::QueryTest < ActiveSupport::TestCase
  setup do
    @query_class = Recipe::Query
    recipe = recipes(:one)
  end

  test "class interface" do
    assert_respond_to @query_class, :resolve
    assert_respond_to @query_class, :query_model
  end

  test "instance interface" do
    instance = @query_class.new(Recipe)
    assert_respond_to instance, :resolve
  end

  test ".resolve returns nothing when there are no ingredients" do
    results = @query_class.resolve([])
    assert_empty results
  end

  test ".resolve returns recipes which uses only salt" do
    results = @query_class.resolve("salt")
    assert_empty results
  end

  test ".resolve returns nothing if there is any ingredient missing" do
    results = @query_class.resolve(%w[oil sugar salt cornmeal walnuts milk])
    assert_empty results
  end

  test ".resolve returns the recipe for which there are no ingredients missing" do
    results = @query_class.resolve(%w[flour cornmeal sugar salt powder egg milk oil])
    assert_equal 1, results.count
    assert_equal "Golden Sweet Cornbread", results.first.title
  end

  test ".resolve case-insensitively returns the recipe for which there are no ingredients missing" do
    results = @query_class.resolve(%w[Flour Cornmeal Sugar SALT powdeR EGG Milk OIL])
    assert_equal 1, results.count
    assert_equal "Golden Sweet Cornbread", results.first.title
  end

  test ".resolve case-insensitively returns all recipes if we have all ingredients" do
    all_ingredients = %w[flour cornmeal sugar salt powder egg milk oil dough cinnamon margarine walnuts raisins]
    results = @query_class.resolve(all_ingredients)
    assert_equal 2, results.count
    assert_equal "Golden Sweet Cornbread", results.first.title
    assert_equal "Monkey Bread I", results.second.title
  end
end
