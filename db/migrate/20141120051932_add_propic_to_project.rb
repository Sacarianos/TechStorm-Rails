class AddPropicToProject < ActiveRecord::Migration
  def change
  	remove_column :projects, :avatar
    add_column :projects, :propic, :string
  end
end
