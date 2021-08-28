class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :personal, foreign_key: true
      t.timestamps
    end
  end
end
