require './app/models/round'

class RoundsController < BaseController

  get '/:id' do
    # show view for displaying questions to user
  end

  post '/new' do
    param :game_id, Integer, required: true
    param :topic_id, Integer, required: true

    round = Round.create!(
      game_id: params[:game_id],
      topic_id: params[:topic_id],
    )

    redirect "/rounds/#{round.id}"
  end
end
