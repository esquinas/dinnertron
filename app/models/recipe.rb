class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients

  validates :cook_duration, :ingredient_list, :prep_duration, :title, presence: true

  # author (string?)
  # category (string?)
  # cook_duration (interval)
  # cuisine (string?)
  # image (string?)
  # ingredient_list (array[string])
  # prep_duration (interval)
  # rating (float?)
  # title (string)

  def self.from_scrape_data(data, null_authors: ["deleteduser"])
    author = data[:author]
    author = author.in?(null_authors) ? nil : author.presence
    title = data.fetch(:title).strip

    find_or_initialize_by(author:, title:) do |recipe|
      recipe.category        = data[:category].presence
      recipe.cook_duration   = data.fetch(:cook_time).to_i.minutes
      recipe.cuisine         = data[:cuisine].presence
      recipe.image           = data[:image].presence
      recipe.ingredient_list = data.fetch(:ingredients).map { _1.presence }.compact
      recipe.prep_duration   = data.fetch(:prep_time).to_i.minutes
      recipe.rating          = data[:ratings].to_f
    end
  end
end
