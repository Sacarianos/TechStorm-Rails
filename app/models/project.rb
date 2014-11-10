class Project < ActiveRecord::Base

	has_many :tasks
	accepts_nested_attributes_for :tasks,:allow_destroy => true

	has_many :comments_on
	has_many :users, :through => :comments_on

	has_many :collaborates
	has_many :users, :through => :collaborates

	has_many :follows
	has_many :users, :through => :follows

	has_many :requires_skill
	has_many :skills, :through => :requires_skill

	has_many :has_tags
	has_many :tags, :through => :has_tags



	 

end
