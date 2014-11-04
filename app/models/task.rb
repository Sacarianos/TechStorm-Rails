class Task < ActiveRecord::Base

	has_many :works_on
	has_many :users, :through => :works_on

	belongs_to :projects
end
