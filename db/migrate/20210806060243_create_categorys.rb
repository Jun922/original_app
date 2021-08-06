class CreateCategorys < ActiveRecord::Migration[6.0]
  def change
    create_table :categorys do |t|
      t.integer    :genre_id
      t.timestamps
    end
  end
end
