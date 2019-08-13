class UpdateGamesTable < ActiveRecord::Migration
  def change
    remove_column(:games, :points)
  end
end
