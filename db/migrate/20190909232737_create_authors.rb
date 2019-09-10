class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :last_name
      t.string :first_name
      t.string :gender
      t.string :sexual_orientation
      t.string :race
      t.string :nationality

      t.timestamps
    end
  end
end
