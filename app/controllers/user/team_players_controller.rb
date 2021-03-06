class User::TeamPlayersController < ApplicationController
  before_action :require_user, :require_verified_user
  skip_before_action :verify_authenticity_token, only: [:create]

  def destroy
    team = current_user.teams.find(team_player_params[:team_id])
    team_player = TeamPlayer.find_by(player: team_player_params[:id], team: team)
    team_player.destroy
    flash[:success] = "Player deleted!"
    redirect_to user_team_path(team)
  end

  def create
    player = Player.find_by(display_name: team_player_params[:myPlayer])
    team = current_user.teams.find(team_player_params[:team_id])
    if player
      team_player = TeamPlayer.find_or_initialize_by(player: player, team: team)
      if team_player.new_record?
        team_player.save
        flash[:success] = "#{player.display_name} has been added to your team!"
      else
        flash[:error] = "#{player.display_name} is already on that team."
      end
    else
      flash[:error] = "No player found matching that name."
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def team_player_params
    params.permit(:team_id, :myPlayer, :id)
  end
end
