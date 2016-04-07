class Post < ActiveRecord::Base
	belongs_to :user
	has_many :guesses
	
	validates_presence_of :user_id
	#validates :category, inclusion:{
	#				in: ["cats", "dogs", "small things", "old rats"],
	#				message: "must be one of cats, dogs, small things or old rats"
	#				}
end
