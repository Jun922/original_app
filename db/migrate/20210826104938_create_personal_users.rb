class CreatePersonalUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_users do |t|
      t.references :personal, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
