class AddSavedDataToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :saved_body, :string
    add_column :authors, :saved_title, :string
  end
end
