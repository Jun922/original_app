class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user,           foreign_key: true
      t.references :following_user, foreign_key: true
      t.references :followed_user,  foreign_key: true
      t.timestamps
    end
  end
end
