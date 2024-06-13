class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.json :response
      t.text :event_payload, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
