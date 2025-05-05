class ResultsController < ApplicationController
  before_action :set_match, only: [:new, :create, :edit, :update]

  def new
    @result = @match.build_result
  end

  def create
    @result = @match.build_result(result_params)
    if @result.save
      redirect_to @match, notice: 'Result was successfully recorded.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @result = @match.result
  end

  def update
    @result = @match.result
    if @result.update(result_params)
      redirect_to @match, notice: 'Result was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def result_params
    params.require(:result).permit(:team1_score, :team2_score, :winner_id)
  end
end
