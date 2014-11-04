class CreateHasTags < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE has_tags (
  		pid integer REFERENCES projects(id),
  		tag varchar(30) REFERENCES tags(tag_name),
  		PRIMARY KEY (pid,tag));
  		")
  end

  def down
  	execute ("DROP TABLE has_tags CASCADE;")
  end
end
