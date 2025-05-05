class Match < ApplicationRecord
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'
  has_one :result, dependent: :destroy

  validates :date, presence: true
  validate :teams_are_different
  validate :teams_are_ready

  private

  def teams_are_different
    if team1_id == team2_id
      errors.add(:base, "A team cannot play against itself")
    end
  end

  def teams_are_ready
    if team1 && team1.players.empty?
      errors.add(:team1, "must have at least one player")
    end
    if team2 && team2.players.empty?
      errors.add(:team2, "must have at least one player")
    end
  end
end
