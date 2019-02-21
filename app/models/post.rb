class Post < ApplicationRecord
	belongs_to :user
	has_many :comments

	include PgSearch

	pg_search_scope :search_post, :associated_against => {:user => [:username]}

	mount_uploader :image, ImageUploader

	# scope :user_id, -> (user_id) {where("user_id = ?", user_id)}

	# scope :user_id, -> (username) {where("users.username ilike ?", "%#{username}%")}


end