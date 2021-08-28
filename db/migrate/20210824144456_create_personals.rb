class CreatePersonals < ActiveRecord::Migration[6.0]
  def change
    create_table :personals do |t|
      t.string :name
      t.timestamps
    end
  end
end
