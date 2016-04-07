class UsersController < ApplicationController
	before_action :authenticate!, only: [:check_auth]

	def login
		@user = User.find_by!(email: params["email"])
		if @user.authenticate(params["password"])
			render json: { user: @user.as_json(only: [:email, :access_token]) },
					status: :ok
		else
			render json: { message: "INVALID EMAIL OR PASSWORD."}
					status: :unauthorized
		end
	end

	def check_auth
		if current_user
			render json: { message: "CURRENT USER: #{current_user.email}"},
					status: :ok
		else
			render json: { message: "AUTHORIZATION IS DOWN."},
					status: :unauthorized
		end
	end
end