class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :link, :string
    add_column :projects, :git, :string
  end
end
