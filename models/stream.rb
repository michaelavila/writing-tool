require 'sinatra/activerecord'

class Stream < ActiveRecord::Base
  def expired?
    Time.now - created_at >= timelimit
  end

  def expires_in
    [0, (timelimit - (Time.now - created_at))].max
  end

  def add_sentence(sentence)
    update_attributes(body: "#{body} #{sentence}")
  end
end
