require_relative './models/stream'

require 'sinatra'
require "sinatra/activerecord"

get '/' do
  haml :index
end

post '/streams' do
  stream = Stream.create!(timelimit: params[:timelimit], body: "")
  stream.id.to_s
end

get '/streams/:id' do
  @stream = Stream.find(params[:id])
  if @stream.expired?
    haml :read
  else
    haml :write
  end
end

post '/streams/:id' do
  stream = Stream.find(params[:id])
  stream.add_sentence(params[:sentence])
end
