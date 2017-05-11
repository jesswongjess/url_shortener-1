#require 'uri'

class Url < ActiveRecord::Base

  validates :long_url, presence: true, allow_blank: false
  validates :long_url, uniqueness: true
  validates :short_url, presence: true, allow_blank: false
  validate :is_valid_url
  #validates :long_url, :format => URI::regexp(%w(http https))

	before_create do 
		self.short_url = shorten
		is_valid_url
	end

    def shorten
    # Write a method here
        return ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(7).join
    end

    # def retrieve_short_url(proper_long_url)
    # 	Url.is_valid_url
    # 	return Url.shorten
    # end	

    def is_valid_url
    #TODO upgrade validations
   		unless !self.long_url.nil? && self.long_url.start_with?("http://", "https://") 
      		errors.add(:long_url, "must start with http:// or https://")
    	end
	end

end