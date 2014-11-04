class CreateWorksOns < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE works_on (
  		uid integer REFERENCES users(id),
  		tid integer,
  		pid integer,
  		FOREIGN KEY (tid,pid) REFERENCES tasks(tid,pid),
  		PRIMARY KEY (uid,tid,pid));
  		")
  end

  def down
  	execute ("DROP TABLE works_on CASCADE;")
  end
end