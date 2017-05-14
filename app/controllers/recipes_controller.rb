class RecipesController < ApplicationController
	def one_recipe_action
		@recipe = Recipe.first
		render 'one_recipe_view.html.erb'
		
	end

	def index
		@recipes = Recipe.all.order(:prep_time)
		sort_attribute = params[:sort]
		if sort_attribute
			@recipes = Recipe.all.order(sort_attribute)
		end	
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
		flash[:success] = "Recipe successfully created"
		redirect_to "/recipes/#{recipe.id}"
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
		flash[:success] = "Recipe successfully updated"
		redirect_to "/recipes/#{recipe.id}"
	end

	def destroy
		recipe = Recipe.find(params[:id])
		recipe.destroy

		flash[:warning] = "Recipe destroyed"
		redirect_to "/"
	end
end
