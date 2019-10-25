class User::TeamsController < ApplicationController
  before_action :require_user

  def index
    @teams = current_user.teams
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    team = current_user.teams.create(team_params)
    if team.save
      flash[:success] = "New team created!"
      redirect_to user_teams_path
    else
      flash[:error] = team.errors.full_messages.to_sentence
      redirect_to new_user_team_path
    end
  end

  def edit
    @team = current_user.teams.find(params[:id])
  end

  def update
    team = current_user.teams.find(params[:id])
    team.update(team_params)
    flash[:success] = "Team name updated!" if team.save
    redirect_to user_teams_path
  end

  def destroy
    team = current_user.teams.find(params[:id])
    # team.team_players.destroy_all
    team.destroy
    flash[:success] = "Team deleted!"
    redirect_to user_teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
