# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"

def show_progress(number)
  Rails.logger.info("Seeding #{number} recipes ...") if (number % 500).zero?
end

recipes_dataset_file_path = Rails.root.join("db", "seeds", "recipes-en.json")

unless recipes_dataset_file_path.exist?
  STDERR.puts "DATASET WAS NOT FOUND IN dataset/#{recipes_dataset_file_path}"

  exit(false)
end

recipes_dataset = JSON.parse(recipes_dataset_file_path.read, symbolize_names: true)

recipes_dataset.each.with_index do |recipe_data, index|
  Recipe.from_scrape_data(recipe_data).then do |recipe|
    recipe.save! if recipe.valid? && recipe.new_record?
  end

  show_progress(index)
end
