# README

## Purpose

This application helps users find the most relevant recipes that they can prepare with the ingredients that they have at home


### DoD
> As User, I want to input ingredients I already have at home and get a list of recipes I can cook immediately with only those ingredients.

## User stories

1. As User, I want to cook only with the ingredients I already have at home, so I spend less time and money
2. As User, I want to get recipes I can cook right away, so I can have dinner sooner

## TASKS
  - [x] I want to select/write/input the ingredients I already have at home.
    + Done as "proof of concept" using a multiple-select HTML element with hardcoded ingrediets
  - [x] I want to easily review the relevant resulting recipes
    + Done UIs for recipes as MVP, no images yet
  - [ ] Optimize query using join table `ingredients_receipts` used for the `has_and_belongs_to_many` relationship, instead of quering inside `recipes.ingredient_list`
  - [ ] Run background job that uses [Edamam Food API](https://developer.edamam.com/food-database-api-docs) to extract single ingredients, as words, from full ingredient lines. For example we'd get `"sugar"` from `"2 cups of sugar, stirred"`
    + [ ] Store those single ingredient keywords in `ingredients` table and store association with `recipes` table
