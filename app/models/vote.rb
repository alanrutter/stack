class Vote < ActiveRecord::Base
	# counter_cache keeps count of how many there are
	belongs_to :story, counter_cache: true
	# scope story makes the validation specific to the story
	validates :ip_address, uniqueness: { scope: :story } 
end
