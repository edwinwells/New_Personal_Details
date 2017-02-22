require "minitest/autorun"
require "rack/test"
require_relative "app.rb"
# require_relative "new_personal_details.rb"

class TestApp < Minitest::Test
 	include Rack::Test::Methods

 	def app
 		PersonalDetailsApp
 	end

 	def test_get_entry_page
 		get "/"
 		assert(last_response.ok?)
 		assert(last_response.body.include?("Hello, what is your name?"
))
 		assert(last_response.body.include?('<form method = "post" action = "name">'))

 	end


end