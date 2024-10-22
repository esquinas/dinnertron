class Recipe
  class Query
    MAX_RESULTS = 10

    def self.query_model = ::Recipe
    def self.resolve(ingredients)
      set_of_ingredients = Array.wrap(ingredients).map(&:downcase).to_set

      new.resolve(set_of_ingredients)
    end

    def initialize(relation = self.class.query_model.all)
      @relation = relation
    end

    def resolve(set_of_ingredients)
      return [] if set_of_ingredients.empty?

      union_pattern = set_of_ingredients.map { |name|
        sanitize_sql(["%s", name])
      }

      sub_condition = "ingredient ~* '\\y(?:#{union_pattern.join("|")})'"

      sql = <<~SQL
        ingredient_list <@ (ARRAY(
          SELECT ingredient
          FROM unnest(ingredient_list) AS ingredient
          WHERE
            #{sub_condition}
        ))
      SQL

      relation.where(sql)
        .order(rating: :desc)
        .take(MAX_RESULTS)
    end

  private
    attr_reader :relation

    def sanitize_sql(...) = self.class.query_model.sanitize_sql(...)
  end
end
