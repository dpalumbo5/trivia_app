require './config/boot'

Dir.glob('./app/{controllers}/*.rb').each { |file| require file }

map('/')                { run BaseController }
map('/auth')            { run LoginController }
map('/game_selection')  { run GameSelectionController }
map('/api/users')       { run UsersController }
map('/users')           { run UserViewsController }
# map('/api/games')       { run GamesController }
# map('/api/questions')   { run QuestionsController }
