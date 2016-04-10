json.array! @posts do |post|
	json.user post.user.username
	json.title post.title
	json.image post.image.url
	json.solution post.solution
	json.post_points post.points
	json.guesses post.guesses
end

json.array! @users do |user|
	json.username user.username
	json.user_points user.points
end