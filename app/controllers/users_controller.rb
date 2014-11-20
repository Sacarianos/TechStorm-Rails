class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
 
  def index
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @projects = Project.find_by_sql "SELECT * FROM projects WHERE creator_id="+params[:id].to_s
    @i_follow = Follows.find_by_sql "SELECT * FROM follows WHERE uid="+params[:id].to_s
    @collaborates = Collaborates.find_by_sql "SELECT * FROM collaborates WHERE user_id="+params[:id].to_s
    @following_me = Follows.find_by_sql "SELECT * FROM follows, projects WHERE follows.pid=projects.id AND creator_id="+params[:id].to_s
  end

  def edit
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
    
  end


 def update 

    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    # For Rails 3
    # account_update_params = params[:user]

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end


  @user = User.find( params[:id])
  if @user.update_attributes(account_update_params)
    sign_in @user, :bypass => true
    respond_with(@user)
  else
    render('edit')
  end
end

private
  
  def user_params
    params.require(:user).permit(:name, :last_name, :email, :website, :facebook, :twitter, :linkedin, :github, :location, :interest, :work_in, :info, :avatar )
  end
  

end
