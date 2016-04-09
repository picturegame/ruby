json.array! @posts do |post|
	json.title post.title
	json.image post.image.url
end
