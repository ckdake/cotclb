class Team < ActiveRecord::Base
  serialize :scoring
  serialize :team_members
end
