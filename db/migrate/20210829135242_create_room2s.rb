class CreateRoom2s < ActiveRecord::Migration[6.0]
  def change
    create_table :room2s do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
