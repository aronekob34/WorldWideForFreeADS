class Flyer < ApplicationRecord
	mount_uploader :image, FlyerUploader

	belongs_to :company
	#belongs_to :language

	#validates_presence_of :company_id, :language_id
end
