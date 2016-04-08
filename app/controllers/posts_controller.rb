class PostsController < ApplicationController
	before_action :authenticate!, only: [:create]

	def create
		@post = current_user.posts.create(title: params["title"],
																			image: params["image"],
																			solution: params["solution"])
    if @post.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index

  end

  private
	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.
	def user_params
	  params.require(:post).permit(:avatar)
	end

end