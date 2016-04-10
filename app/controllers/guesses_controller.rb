class GuessesController < ApplicationController
	before_action :authenticate!, only [:new]

	def new
		@image = Post.find(params["id"])
		correct = @image.solution == params[:guess]
		if correct
			@image.update(solved: true)
			current_user.update(points: += @image.points)
		else
			@image.update(points: += 1)
		end
      	@guess = current_user.guesses.create!(correct: correct,
                                             post_id: @image.id,
                                             guess: params["guess"])
      	render "new.json.jbuilder", status: :created
      	#readme - if the image id doesnt exist this sends 404 status
	end

	def show
		@image = Post.find(params["id"])
		@guess = @image.guesses.guess.all
		render "show.json.builder", status: :ok
		#if fails, will throw a ActiveRecord::Record not found exception
	end
end