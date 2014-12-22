require 'mandrill'

MANDRILL = Mandrill::API.new(ENV["MANDRILL_API_KEY"])
