class Contact < ActiveRecord::Base
	# has_attached_file :image

	# do_not_validate_attachment_file_type :avatar

	def to_s
	    "#{self.name}"
	end
end
