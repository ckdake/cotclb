class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :score
      t.text :description
      t.text :scoring
      t.text :team_members

      t.timestamps
    end
  end
end
