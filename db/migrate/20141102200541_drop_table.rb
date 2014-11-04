class DropTable < ActiveRecord::Migration
  def change
  	drop_table :websites_tables
  	drop_table :websites
  end
end
