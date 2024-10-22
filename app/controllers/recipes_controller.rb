class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show ]

  # GET /recipes
  def index
    @all_ingredients = ["almond", "apple", "avocado", "bacon", "baking powder", "baking soda", "banana",
      "beef", "bread", "butter", "cabbage", "cardamom", "carrot", "cayenne", "celery", "cheese", "chicken",
      "chile", "chorizo", "cilantro", "cinnamon", "cod", "cooking spray", "corn", "cornstarch", "cumin", "dough",
      "egg", "flour", "garlic", "ginger", "guacamole", "jalapeno", "ketchup", "lamb", "lemmon", "lettuce",
      "mayo", "milk", "mustard", "oat", "oil", "onion", "oregano", "paprika", "parsley", "peanut", "peas", "pepper", "pork",
      "radish", "raisin", "salmon", "salt", "sardine", "sausage", "sugar", "tofu", "tomato", "turkey",
      "vanilla", "vinegar", "walnut", "water", "wine", "worcestershire sauce", "yeast", "yogurt"]
    @ingredients = index_params.fetch(:q, [])

    @recipes = Recipe::Query.resolve(@ingredients)
  end

  # GET /recipes/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params.expect(:id))
    end

    def index_params
      params.permit(q: [])
    end
end
