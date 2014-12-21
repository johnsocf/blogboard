class AddSavedContentPath < ActiveRecord::Migration
  def change
      add_column :blogposts, :saved_title, :string
      add_column :blogposts, :saved_content, :string
  end
end
