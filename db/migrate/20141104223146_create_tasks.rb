class CreateTasks < ActiveRecord::Migration
  def up
    # create_table :tasks do |t|
    #   t.timestamps
    # end
    execute ("
    	CREATE TABLE tasks (
    		tid serial,
    		project_id integer REFERENCES projects(id),
    		task_name	varchar(30),
    		description	text,
    		completed	integer,
    		PRIMARY KEY (tid, project_id),
    		CHECK (completed <= 100 and completed>= 0)
    		);")
  end

  def down
		execute ("DROP TABLE tasks CASCADE;")
	end
end
