class Url < ActiveRecord::Base
	validates :long_url, presence:true, uniqueness:true
	validates :short_url, presence:true, uniqueness:true
	validate :proper_url?, if: :long_url
	
	# before_validation do
	# 	self.short_url = shorten
	# end

	def proper_url? 
		if !(self.long_url.start_with?('http://') || self.long_url.start_with?('https://'))
			errors.add(:long_url, "is in invalid format.")
		end 
	end

	def self.retrieve_short_url(long_url)
		u = Url.find_by(long_url:long_url)
		if u.nil?
			return nil
		else 
			return u.short_url
		end
	end	

end
