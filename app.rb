require 'sinatra'
class PersonalDetailsApp < Sinatra::Base
    get '/' do
        erb :name
    end

    post '/name' do
        name = params[:name]
        redirect '/age?user_name=' + name
    end



    get '/age' do
        erb :age, :locals=>{user_name=>params[:user_name]}
    end

    post '/age' do
        user_age = params[:user_age]
        user_name = params[:user_name]
        redirect '/location?user_name=' + user_name + '&user_age' + user_age
    end

    get '/location' do
        erb :location, :locals=>{:user_name=>params[:user_name], :age=>params[user_age]}
    end
    
    post '/numbers' do
        num1 = params[:num1]
        num2 = params[:num2]
        num3 = params[:num3]
        age = params[:user_age]
        location = params[:user_location]
        name = params[:user_name]
        sum_of_nums = num1.to_i + num2.to_i + num3.to_i

        if sum_of_nums > age.to_i
            age_compare = "Your favorite nums added together is greater than your age"

       elsif sum_of_nums < age.to_i
           age_compare = "Your favorite nums added together is less than your age"

       else
           age_compare = "Your favorite nums added together is equal to your age"

       end

       erb :numbers
    end
end