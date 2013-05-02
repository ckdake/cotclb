class AddsUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :nick_name
      t.string :uid
      t.boolean :active, default: true
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
