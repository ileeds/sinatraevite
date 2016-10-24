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

get '/person/new' do
	erb :new_people
end

get '/event/new' do
	erb :new_events
end

get '/registration/new' do
	erb :new_registrations
end

get '/error' do
	@error
	erb :error
end

post '/person/submit' do
	@person = Person.new(params[:person])
	if @person.save
		redirect '/persons'
	else
		"Sorry, there was an error!"
	end
end

post '/event/submit' do
	@event = Event.new(params[:event])
	if @event.save
		redirect '/events'
	else
		"Sorry, there was an error!"
	end
end

post '/registration/submit' do
	p_id=params[:registration][:person_id]
	person=Person.find_by(name: p_id)
	if person.nil?
		redirect '/error'
	end
	e_id=params[:registration][:event_id]
	event=Event.find_by(name: e_id)
	if event.nil?
		redirect '/error'
	end
	params[:registration][:person_id]=person.id
	params[:registration][:event_id]=event.id
	@registration = Registration.new(params[:registration])
	if @registration.save
		redirect '/registrations'
	else
		"Sorry, there was an error!"
	end
end
