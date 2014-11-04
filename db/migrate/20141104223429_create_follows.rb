class CreateFollows < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE follows (
  		uid integer REFERENCES users(id),
  		pid integer REFERENCES projects(id),
  		PRIMARY KEY (uid,pid));
  		")
  end

  def down
  	execute ("DROP TABLE follows CASCADE;")
  end
end
