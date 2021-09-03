class CreateRoom2Users < ActiveRecord::Migration[6.0]
  def change
    create_table :room2_users do |t|
      t.references :room2, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
