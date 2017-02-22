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
 		assert(last_response.body.include?('<center><h1>"Hello, what is your name?"</h1><center>'))
 		assert(last_response.body.include?('<form method = "post" action = "name">'))
 		assert(last_response.body.include?('<input type ="text" name ="user_name">'))

 	end
def test_post_name

    post '/name', name: 'Edwin'  # corresponds to name = params[:name]
    follow_redirect!  # need to specify to follow through route
    assert(last_response.ok?)
    assert(last_response.body.include?('Edwin'))  # getting value via redirect in post '/name'
  end

  # def test_get_age
  #   get '/age', user_name: 'jv'
  #   # get '/age?user_name=jv'  # variation of previous line
  #   assert(last_response.ok?)
  #   assert(last_response.body.include?('jv'))
  #   # can now add other assertions (form, input box)
  #   # assert(last_response.body.include?('What is your name?'))
  #   # assert(last_response.body.include?('<input type="text" name="name">'))
  #   # assert(last_response.body.include?('<form method="post" action="name">'))
  # end


# create tests for anything on the page that might break things

# controls (such as forms) and variables
end

# - can run from terminal to verify that Gemfile is good:

#      bundle exec ruby tests/tests_app.rb

# - if something wrong in Gemfile will throw an error