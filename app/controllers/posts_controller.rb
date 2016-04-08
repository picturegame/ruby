class PostsController < ApplicationController
	before_action :authenticate!, only: [:create]

	def create
		@post = current_user.posts.create(title: params["title"],
																			image_url: params["image_url"],
																			solution: params["solution"])
    if @post.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index

  end



	# def login
	# 	@user = User.find_by!(email: params["email"])
	# 	if @user.authenticate(params["password"])
	# 		render json: { user: @user.as_json(only: [:email, :access_token]) },
	# 				status: :ok
	# 	else
	# 		render json: { message: "INVALID EMAIL OR PASSWORD."},
	# 				status: :unauthorized
	# 	end
	# end

	# def check_auth
	# 	if current_user
	# 		render json: { message: "CURRENT USER: #{current_user.email}"},
	# 				status: :ok
	# 	else
	# 		render json: { message: "AUTHORIZATION IS DOWN."},
	# 				status: :unauthorized
	# 	end
	# end
end