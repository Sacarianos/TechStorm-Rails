class AddColumnsToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :type, :string
    add_column :websites, :url, :string
    add_reference :websites, :user, index: true
  end
end
