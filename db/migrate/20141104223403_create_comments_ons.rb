class CreateCommentsOns < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE comments_on (
  		uid integer REFERENCES users(id),
  		pid integer REFERENCES projects(id),
  		date timestamp,
  		comment text,
  		PRIMARY KEY (uid,pid));
  		")
  end

  def down
  	execute ("DROP TABLE comments_on CASCADE;")
  end

end
