class CreateThirdPartyServices < ActiveRecord::Migration[7.1]
  def change
    create_table :third_party_services do |t|
      t.text :url, null: false
      t.integer :event_id
      t.timestamps
    end
  end
end
