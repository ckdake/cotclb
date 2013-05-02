class Team < ActiveRecord::Base
  scope :ordered, -> { order("score DESC") } 
end
