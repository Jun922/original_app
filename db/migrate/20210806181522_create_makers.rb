class CreateMakers < ActiveRecord::Migration[6.0]
  def change
    create_table :makers do |t|
      t.text :content,        null: false
      t.references :user,     foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
