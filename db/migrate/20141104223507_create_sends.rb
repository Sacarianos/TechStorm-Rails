class CreateSends < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE sends (
  		sender integer REFERENCES users(id),
  		receiver integer REFERENCES users(id),
  		mid integer REFERENCES messages(id),
  		PRIMARY KEY (sender,receiver,mid));
  		")
  end

  def down
  	execute ("DROP TABLE sends CASCADE;")
  end
end