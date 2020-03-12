class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.references :incident_type, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.string :location
      t.string :status
      t.timestamps
    end
  end
end
