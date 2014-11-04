class CreateMessages < ActiveRecord::Migration
  def up
    # create_table :messages do |t|
    #   t.timestamps
    # end
    execute ("
    	CREATE TABLE messages (
    		id	SERIAL PRIMARY KEY,
    		title	varchar(40),
    		content	text,
    		send_time	timestamp,
    		seen_time	timestamp
    		);")
  end

  def down
		execute ("DROP TABLE messages CASCADE;")
	end
end
