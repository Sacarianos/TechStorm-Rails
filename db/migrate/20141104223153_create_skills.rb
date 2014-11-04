class CreateSkills < ActiveRecord::Migration
  def up
    # create_table :skills do |t|
    #   t.timestamps
    # end
    execute ("
    	CREATE TABLE skills (
    		skill_name	varchar(30) PRIMARY KEY
    		);")
  end

  def down
		execute ("DROP TABLE skills CASCADE;")
	end
end
