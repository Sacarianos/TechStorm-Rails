class ChangeColumn < ActiveRecord::Migration
  def change
  	rename_column :tasks, :pid, :project_id
  end
end
