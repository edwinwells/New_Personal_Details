require 'sinatra'
class PersonalDetailsApp < Sinatra::Base
    get '/' do
        erb :name
    end

    post '/name' do
        name = params[:name]
        redirect '/age?name=' + name
    end


    get '/age' do
        erb :age, :locals => {:user_name => params[:user_name]}
    end

    post '/age' do
        age = params[:age]
        user_name = params[:user_name]
        redirect '/location?user_name=' + user_name + '&age=' + age
    end

    get '/location' do
        erb :location, :locals=>{:user_name=>params[:user_name],:age=>params[:age]}
    end

    post '/location' do
        user_location = params[:user_location]
        age = params[:age]
        user_name = params[:user_name]
        redirect '/numbers?user_name=' + user_name + '&age=' + age + '&user_location=' + user_location
    end

    get '/numbers' do
        erb :numbers, :locals=>{:user_name=>params[:user_name],:age=>params[:age],:user_location=>params[:user_location]}
    end
    post '/numbers' do
        num1 = params[:num1]
        num2 = params[:num2]
        num3 = params[:num3]
        user_location = params[:user_location]
        age = params[:age]
        user_name = params[:user_name]

        redirect '/favorites?num1=' + num1 + '&num2=' + num2 + '&num3=' + num3 + '&user_name=' + user_name + '&age=' + age + '&user_location=' + user_location
    end

    get '/favorites' do
        num1 = params[:num1]
        num2 = params[:num2]
        num3 = params[:num3]
        user_location = params[:user_location]
        age = params[:age]
        user_name = params[:user_name]
        # sum_of_nums = params [:num1] + params[:num2] + params[:num3]

        sum_of_nums = num1.to_i + num2.to_i + num3.to_i

        if sum_of_nums > age.to_i
            age_compare = "Your favorite numbers added together are greater than your age!"

        elsif sum_of_nums < age.to_i
            age_compare = "Your favorite numbers added together are less than your age!"

        else
            age_compare = "Your favorite numbers added together are equal to your age!"
        end
            erb :favorites, :locals=>{:user_name=>params[:user_name], :age=>params[:age],:user_location=>params[:user_location],:num1=>params[:num1],:num2=>params[:num2],:num3=>params[:num3],:age_compare=>age_compare,:sum_of_nums=>sum_of_nums}
    end

end