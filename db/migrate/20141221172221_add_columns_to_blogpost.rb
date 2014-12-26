class AddColumnsToBlogpost < ActiveRecord::Migration
  def change
      add_column :blogposts, :title, :string
      add_column :blogposts, :body, :body
      add_column :blogposts, :user, :string
      add_column :blogposts, :image_file_name, :string
      add_column :blogposts, :image_content_type, :string
      add_column :blogposts, :image_file_size, :integer
      add_column :blogposts, :image_updated_at, :datetime
      add_column :blogposts, :saved_title, :string
      add_column :blogposts, :saved_content, :string
  end
end
