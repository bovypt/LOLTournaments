class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :set_team, only: [:new, :create]

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = @team.players.build
  end

  def create
    @player = @team.players.build(player_params)
    if @player.save
      redirect_to @team, notice: 'Player was successfully added to the team.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to @player.team, notice: 'Player was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    team = @player.team
    @player.destroy
    redirect_to team, notice: 'Player was successfully removed from the team.'
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :role)
  end
end
