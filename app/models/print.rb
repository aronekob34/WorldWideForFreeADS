class Print < ApplicationRecord
	belongs_to :run

	#validates_presence_of :company_number, :print
end
