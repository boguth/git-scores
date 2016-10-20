require 'open-uri'
require 'json'

class GitReader
	attr_reader :uri, :response

	def initialize(uri)
		@uri = uri
	end

	def execute_calculation
		valid_uri ? get_response : "Sorry, the uri you provided was invalid"
	end	

	private
	def get_response
		@response = open(@uri).read
		process_json
	end

	def process_json
		if valid_json?
			JSON.parse(@response).each {|c| puts c}	
		else
			'This is shitty JSOON'
		end
	end

	def valid_uri
		@uri == "https://api.github.com/users/dhh/events/public"
	end

	def valid_json?
		begin
    	JSON.parse(@response)
    	return true
  	rescue JSON::ParserError => e
    	return false
    end
  end
end
