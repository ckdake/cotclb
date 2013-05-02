json.array!(@teams) do |team|
  json.extract! team, :name, :score, :description, :scoring, :team_members
  json.url team_url(team, format: :json)
end