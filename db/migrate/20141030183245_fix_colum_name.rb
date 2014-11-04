class FixColumName < ActiveRecord::Migration
  def change
  	rename_column :users, :lastName, :last_name
  	rename_column :users, :worksIn, :works_in
  end
end
