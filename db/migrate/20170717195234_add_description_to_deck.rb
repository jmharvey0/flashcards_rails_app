class AddDescriptionToDeck < ActiveRecord::Migration[5.1]
  def change
    add_column :decks, :description, :string
  end
end
