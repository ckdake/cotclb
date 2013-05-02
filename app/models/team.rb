class Team < ActiveRecord::Base
  validates :scoring_technical_wizadry, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
  validates :scoring_utility, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 25 }
  validates :scoring_people_bonus, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :scoring_penalties, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :scoring_bonuses, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  
  scope :ordered, -> { order("score DESC") }
  
  before_save :update_scoring
  
  private
  def update_scoring
    self.score = total_score
  end
  
  def total_score
    scoring_technical_wizadry + scoring_utility + scoring_people_bonus + scoring_penalties + scoring_bonuses
  end
end
