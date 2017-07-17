class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.references :user, foreign_key: true
      t.references :deck, foreign_key: true
      t.integer :correct_first_try
      t.integer :total_guesses

      t.timestamps
    end
  end
end
