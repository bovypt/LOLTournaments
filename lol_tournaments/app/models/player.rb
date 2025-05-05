class Player < ApplicationRecord
  belongs_to :team

  validates :first_name, :last_name, :role, presence: true
  validates :role, inclusion: { in: %w[Top\ laner Jungler Mid\ laner ADC Support] }
  validate :team_can_add_player

  private

  def team_can_add_player
    if team && !team.can_add_player?
      errors.add(:team, "can't have more than 5 players")
    end
  end
end
