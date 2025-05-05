class StandingsController < ApplicationController
  def index
    @teams = Team.ranked
  end
end 