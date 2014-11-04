class CreateRequiresSkills < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE requires_skills (
  		pid integer REFERENCES projects(id),
  		skill varchar(30) REFERENCES skills(skill_name),
  		PRIMARY KEY (pid,skill));
  		")
  end

  def down
  	execute ("DROP TABLE requires_skills CASCADE;")
  end
end
