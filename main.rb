require 'rubygems'
require 'sinatra'
require 'activerecord'
require 'lib/models'
require 'lib/assets'
require 'lib/nav'

module Theory
  class Site < Sinatra::Base
    enable :sessions

    helpers do
      include Sinatra::Assets
      include Sinatra::Nav  
    end

    before do
     @flash = Hash.new
     @flash = session[:flash]
     session[:flash] = Hash.new
    end

    get '/' do
      erb :index
    end

    get '/about' do
      erb :about
    end

    get '/work' do
      erb :work
    end

    get '/contact' do
      erb :contact
    end

    post '/contact' do
      @contact = Contact.new(params['contact'])
      if @contact.save
        Pony.mail(
          :to => 'scriptfu@gmail.com',
          :from => 'webform@theoryandlogic.com',
          :subject => "[THEORY] New message from #{params['contact']['name']}",
          :body => "Name: #{params['contact']['name']}\nWebsite: #{params['contact']['website']}\nMessage: #{params['contact']['message']}\n",
          :via => :smtp,
          :smtp => {
            :host => 'mail.theoryandlogic.com',
            :port => '26',
            :user => 'webform@theoryandlogic.com',
            :password => 'awesomesauce',
            :auth => :login,
            :domain => "localhost.localdomain"
          }
        )
        session[:flash][:success] = "Thank you! We'll be in touch soon."
        redirect '/'
      else
        session[:flash][:error] = "Sorry, your message could not be sent.  Please try again."
        erb :contact
      end
    end

    error do
      @error = request.env['sinatra.error'].to_s
      content_type 'text/html'
      erb :error
    end unless Sinatra::Application.environment == :development

    not_found do
      erb :four_oh_four
    end
    
  end
  
  class Blog < Sinatra::Base 
    helpers do
      include Sinatra::Assets
      include Sinatra::Nav  
    end
    
    get '/?' do 
      erb :blog
    end
    
  end
end