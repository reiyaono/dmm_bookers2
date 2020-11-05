class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
