require 'sinatra'
require 'sinatra/param'
require 'sinatra/reloader'
require 'json'
require 'rack/parser'
require 'sinatra/json'
require 'sinatra/flash'
require './app/models/user'

configure { set :server, :puma }

class BaseController < Sinatra::Base

  helpers   Sinatra::Param
  register  Sinatra::Flash
  use       Rack::Parser
  set       :views,         Proc.new { File.join(root, "../views") }
  set       :public_folder, Proc.new { File.join(root, "../../public") }
  configure (:development) { register Sinatra::Reloader }

  before '/api*' do
    content_type :json
    request.body.rewind
    @request_body    = request.body.read
    @request_payload = JSON.parse(@request_body) unless @request_body.empty?
  end

end
