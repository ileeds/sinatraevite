require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' # database configuration
require './models/person'
require './models/event'
require './models/registration'
require 'byebug'

get '/' do
	erb :index
end

get '/persons' do
	@people = Person.all
	erb :people
end

get '/events' do
	@events = Event.all
	erb :events
end

get '/registrations' do
	@registrations = Registration.all
	erb :registrations
end

post '/person/new' do
	@person = Person.new(params[:person])
	if @person.save
		redirect '/persons'
	else
		"Sorry, there was an error!"
	end
end

post '/event/new' do
	@event = Event.new(params[:event])
	if @event.save
		redirect '/events'
	else
		"Sorry, there was an error!"
	end
end

post '/registration/new' do
	@registration = Registration.new(params[:registration])
	if @registration.save
		redirect '/registrations'
	else
		"Sorry, there was an error!"
	end
end
