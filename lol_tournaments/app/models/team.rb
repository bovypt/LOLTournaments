class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :team1_matches, class_name: 'Match', foreign_key: 'team1_id'
  has_many :team2_matches, class_name: 'Match', foreign_key: 'team2_id'
  has_many :won_matches, class_name: 'Result', foreign_key: 'winner_id'

  validates :name, presence: true, uniqueness: true

  def matches
    team1_matches.or(team2_matches)
  end

  def can_add_player?
    players.count < 5
  end

  def wins
    won_matches.count
  end

  def losses
    matches.count { |match| match.result && match.result.winner_id != id }
  end

  def draws
    matches.count { |match| match.result && match.result.winner_id.nil? }
  end

  def points
    (wins * 3) + draws
  end

  def goal_difference
    matches.sum do |match|
      if match.result
        if match.team1_id == id
          match.result.team1_score - match.result.team2_score
        else
          match.result.team2_score - match.result.team1_score
        end
      else
        0
      end
    end
  end

  def self.ranked
    all.sort_by { |team| [-team.points, -team.goal_difference, team.name] }
  end
end
