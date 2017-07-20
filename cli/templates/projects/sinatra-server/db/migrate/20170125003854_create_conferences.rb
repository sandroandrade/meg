class CreateConferences < ActiveRecord::Migration[5.0]
  def change
    create_table :conferences do |t|
      t.string :acronym
      t.string :name
      t.string :city
      t.string :country
      t.string :venue
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
