class CreateMediations < ActiveRecord::Migration[6.0]
  def change
    create_table :mediations, id: :uuid do |t|
      t.string :mediation_type, null: false
      t.string :user_id, null: false, foreign_key: true
      t.string :protocol_number

      t.timestamps
    end
  end
end
