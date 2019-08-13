require 'sinatra'
require 'sinatra/param'
require 'sinatra/reloader'
require 'json'
require 'rack/parser'
require 'sinatra/json'
require 'sinatra/flash'
require 'active_record'
require './app/models/user'
require './app/models/question'
require './app/models/game'
require './app/models/auth_token'

configure { set :server, :puma }

class BaseController < Sinatra::Base

  helpers   Sinatra::Param
  register  Sinatra::Flash
  use       Rack::Parser
  set       :views,         Proc.new { File.join(root, "../views") }
  set       :public_folder, Proc.new { File.join(root, "../../public") }
  set :absolute_redirects, true
  configure (:development) { register Sinatra::Reloader }

  before '/api*' do
    content_type :json
    request.body.rewind
    @request_body    = request.body.read
    @request_payload = JSON.parse(@request_body) unless @request_body.empty?
  end

  before '*' do
    return if request.path == '/auth/login'
    return if request.path == '/users/new'
    return if request.path == '/game_selection'

    # find auth token cookie
    token = request.cookies['Auth-Token']
    # if it doesn't exist, redirect user to login
    if token.nil?
      redirect '/auth/login'
    end

    auth_token = AuthToken.where(token:token).first

    if auth_token.nil?
      redirect '/auth/login'
    end

    @current_user = auth_token.user
  end

  error 400..502 do
    json error_message: "There is an error with your request"
  end
end
