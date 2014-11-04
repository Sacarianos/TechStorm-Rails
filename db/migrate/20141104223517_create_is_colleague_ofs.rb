class CreateIsColleagueOfs < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE has_tasks (
  		user1 integer REFERENCES users(id),
  		user2 integer REFERENCES users(id),
  		pending boolean,
  		PRIMARY KEY (user1,user2));
  		")
  end

  def down
  	execute ("DROP TABLE is_colleague_of CASCADE;")
  end
end
