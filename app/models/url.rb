class Url < ActiveRecord::Base

  validates_presence_of :long_url, :short_url
  validate :is_valid_url
  after_initialize :shorten

	before_create do 
		self.short_url = shorten
	end

    def shorten
    # Write a method here
        return ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(7).join unless nil
    end

    def self.retrieve_short_url(proper_long_url)
        url = Url.find_by(long_url: long_url)

    	  if url.nil? 
          return nil
        else 
         return url.short_url
        end 
    end	
    
    private
    def is_valid_url
    #TODO upgrade validations
   		unless !self.long_url.nil? && self.long_url.start_with?("http://", "https://") 
      		errors.add(:long_url, "must start with http:// or https://")
    	end
	end

end