class RecipesController < ApplicationController
	def one_recipe_action
		@recipe = Recipe.first
		render 'one_recipe_view.html.erb'
		
	end

	def index
		@recipes = Recipe.all
		
	end

	def show
		recipe_id = params[:id]
		@recipe = Recipe.find_by(id: recipe_id)
	end

	def new
		
	end

	def create
		recipe = Recipe.new(
												title: params[:title], 
												chef: params[:chef], 
												ingredients: params[:ingredients], 
												directions: params[:directions] 
												)
		recipe.save
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		recipe = Recipe.find(params[:id])
		recipe.assign_attributes(
															title: params[:title], 
															chef: params[:chef], 
															ingredients: params[:ingredients], 
															directions: params[:directions])
		recipe.save
	end
end
