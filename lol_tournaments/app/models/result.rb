class Result < ApplicationRecord
  belongs_to :match
  belongs_to :winner, class_name: 'Team', optional: true

  validates :team1_score, :team2_score, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :winner_is_valid
  validate :scores_are_valid

  private

  def winner_is_valid
    if winner && ![match.team1_id, match.team2_id].include?(winner_id)
      errors.add(:winner, "must be one of the teams in the match")
    end
  end

  def scores_are_valid
    if team1_score == team2_score && winner.present?
      errors.add(:base, "Cannot have a winner in a draw")
    elsif team1_score > team2_score && winner_id != match.team1_id
      errors.add(:winner, "must be team1 when team1 has higher score")
    elsif team2_score > team1_score && winner_id != match.team2_id
      errors.add(:winner, "must be team2 when team2 has higher score")
    end
  end
end
