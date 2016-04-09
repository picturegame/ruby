json.array! @posts do |post|
	json.user post.user.username
	json.title post.title
	json.image post.image.url
end
