class UsersController < ApplicationController
  before_filter :authenticate_user!
 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
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
    params.require(:user).permit(:name, :last_name, :email, :website, :facebook, :twitter, :linkedin, :github, :location, :interest, :work_in, :info )
  end
  

end
