class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  def index
    recipes = Recipe.all.order(created_at: :desc)
    render json: recipes
  end

  def create
    recipe = Recipe.create!(recipe_params)
    if recipe
      render json: recipe, status: :created
    else
      render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @recipe, include: [:ingredients]
  end

  def destroy
    @recipe&.destroy
    render json: { message: 'Recipe deleted!' }
  end

  private

  def recipe_params
    params.permit(:name, :image, :ingredients, :instruction)
  end

  def set_recipe
    @recipe = Recipe.includes(:ingredients).find(params[:id])
  end
end
