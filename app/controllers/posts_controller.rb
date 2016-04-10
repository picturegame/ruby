class PostsController < ApplicationController
	before_action :authenticate!, only: [:create, :destroy]

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
  	@posts = Post.all
  	@users = User.all
  	render "index.json.jbuilder", status: :ok
  end

  def destroy
  	@post = Post.find_by(id: params["id"])
  	if current_user.id == @post.user.id
  		@post.destroy
  		render json: "POST DESTROYED",
  		satus: :accepted
		else
			render json: { error: "INVALID PERMISSION" },
				status: :unauthorized
		end
  end

end