require './app/controllers/base_controller'
require './app/models/topic'

class GameSelectionController < BaseController

  get '/:id' do
    param :id, Integer, required: true
    @all_topics = Topic.all
    #distinct will get the categories in a SQL query (quicker than ruby), then it orders by topic name alphabetically, and pluck returns only the topic
   erb :game_selection, layout: :default_layout
  end
end
