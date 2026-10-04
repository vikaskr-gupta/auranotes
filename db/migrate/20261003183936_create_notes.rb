class CreateNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :description
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
