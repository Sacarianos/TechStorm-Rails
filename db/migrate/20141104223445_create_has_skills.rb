class CreateHasSkills < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE has_skills (
  		uid integer REFERENCES users(id),
  		skill varchar(30) REFERENCES skills(skill_name),
  		PRIMARY KEY (uid,skill));
  		")
  end

  def down
  	execute ("DROP TABLE has_skills CASCADE;")
  end
end
