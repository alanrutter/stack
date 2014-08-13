class StoriesController < ApplicationController
	
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
			# @string ="My string of characters"
			# @time =Time .now
			if params[:sort] == "popular"
				@stories = Story.all.order('votes_count DESC')
			elsif params[:sort] == "featured"
				@stories = Story.where(is_featured: true)
			else	
				@stories= Story.all.order('created_at DESC')
			end
	end

	def show
		# refactor the code to be DRY
		# @story = Story.find(params[:id])
	end

	def new
		@story= Story.new
	end

	def create 

		@story = Story.new(story_params)
		
		if @story.save
		
			flash[:success] = "Thank for submitting a story!"
		
		redirect_to root_path
	
		else
	
			flash[:error] = "Oops, something went wrong, please try again…"
			render :new
	
		end
		
	end
	
	def edit
		# refactor the code to be DRY
		# @story = Story.find(params[:id])
	end

	def update
		# refactor the code to be DRY
		# @story = Story.find(params[:id])
		
		if @story.update(story_params)
		
			flash[:success] = "Thank for updating this story!"
			redirect_to story_path(@story)
		
		else
		
			flash[:error] = "Oops, something went wrong, please try and again…"
			render :edit
		
		end
	
	end

	def destroy
		# refactor the code to be DRY
		# @story = Story.find(params[:id])
		
		if @story.present?
		
			flash[:success] = "Successfully destroyed '#{@story.title}'"
			@story.destroy
		
		else 
		
			flash[:error] = "Oops, no story found with id #{params[id]}"
		
		end
		
		redirect_to root_path
	
	end

	private
	def story_params
		params.require(:story).permit(:title, :url, :description)
	end

	def find_story
		@story = Story.find(params[:id])
	end

end
