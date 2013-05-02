class FixScoringCriteria < ActiveRecord::Migration
  def up
    remove_column :teams, :scoring
    add_column :teams, :scoring_technical_wizadry, :integer, default: 0
    add_column :teams, :scoring_utility, :integer, default: 0
    add_column :teams, :scoring_people_bonus, :integer, default: 0
    add_column :teams, :scoring_penalties, :integer, default: 0
    add_column :teams, :scoring_bonuses, :integer, default: 0
  end
  
  def down
    add_column :teams, :scoring, :text
    remove_column :teams, :scoring_technical_wizadry
    remove_column :teams, :scoring_utility
    remove_column :teams, :scoring_people_bonus
    remove_column :teams, :scoring_penalties
    remove_column :teams, :scoring_bonuses
  end
end
