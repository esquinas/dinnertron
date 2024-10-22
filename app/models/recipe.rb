class Recipe < ApplicationRecord
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
end
