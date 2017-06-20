require './config/boot'

Dir.glob('./app/{controllers}/*.rb').each { |file| require file }

map('/')          { run BaseController }
map('/login')     { run LoginViewsController }
