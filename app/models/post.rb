class Post < ActiveRecord::Base
	belongs_to :user
	has_many :guesses
	
	validates_presence_of :user_id	

	########### Begin Paperclip stuff ############
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	########### End Paperclip stuff ############
	
	#validates :category, inclusion:{
	#				in: ["cats", "dogs", "small things", "old rats"],
	#				message: "must be one of cats, dogs, small things or old rats"
	#				}
end
