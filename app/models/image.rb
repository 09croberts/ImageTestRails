class Image < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	validates :body_type, presence: true

	def self.search_btype(search)
		if search
			where(["body_type LIKE ?", "%#{search}%"])
		else
			all
		end
	end

	def self.search_date(search)
		puts search
		if search
			where(["created_at >= ?", search.to_time])
		else
			all
		end
	end
end
