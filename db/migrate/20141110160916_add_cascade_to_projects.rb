class AddCascadeToProjects < ActiveRecord::Migration
  def change
  	execute ("
    	ALTER TABLE projects ADD CONSTRAINT my_fk FOREIGN KEY (creator_id) REFERENCES users ON DELETE CASCADE;")
  end
end

