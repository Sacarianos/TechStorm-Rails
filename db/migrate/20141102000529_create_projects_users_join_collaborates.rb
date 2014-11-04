class CreateProjectsUsersJoinCollaborates < ActiveRecord::Migration
  def change
    create_table :collaborates, :id => false do |t|
    	t.integer "user_id"
    	t.integer "project_id"
    end
    add_index :collaborates, ["user_id", "project_id"]
  end
end
