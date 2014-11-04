class CreateTags < ActiveRecord::Migration
  def up
  	execute ("
    	CREATE TABLE tags (
    		tag_name	varchar(30) PRIMARY KEY
    		);")
  end

  def down
  	execute ("DROP TABLE tags CASCADE;")
  end
end
