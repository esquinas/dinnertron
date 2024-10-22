class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show ]

  # GET /recipes
  def index
    @recipes = Recipe.all.order("RANDOM()").take(5)
  end

  # GET /recipes/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params.expect(:id))
    end
end
