class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


	

	mount_uploader :avatar, AvatarUploader


# app/views/users/_form.html.erb



	has_many :sends
	has_many :messages, :through => :sends

	has_many :is_colleague_of
	has_many :users, :through => :is_colleague_of

	has_many :works_on
	has_many :tasks, :through => :works_on

	has_many :comments_on
	has_many :projects, :through => :comments_on

	has_many :collaborates
	has_many :projects, :through => :collaborates

	has_many :follows
	has_many :projects, :through => :follows

	has_many :has_skill
	has_many :skills, :through => :has_skill


scope :alphasort, lambda { order("users.first_name ASC") }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
