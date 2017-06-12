class RunValidator < ActiveModel::Validator
	def validate(record)
		record.errors[:base] << "Did you give away the fliers? Then set the Print Order in the Print List as completed, otherwise delete the print order or edit it.. You can create one Print at the time, give it away, set it as completed and then print more..You can download it as many times as you want, but can not create multiple unfinished orders" if Campaign.find(record[:campaign_id]).runs.where.not(:status => "completed").size > 0
	end
end