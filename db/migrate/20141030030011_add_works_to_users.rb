class AddWorksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :worksIn, :string
    add_column :users, :ranking, :integer
    add_column :users, :privacy, :boolean
    add_column :users, :info, :text
    add_column :users, :visits, :integer
  end
end
