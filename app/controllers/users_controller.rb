class UsersController < ApplicationController
  def new 
    @user = User.new
  end
  
  def create
    @user = User.new( params[ :user ] )
    
    if @user.save 
      redirect_to :welcome_index, :flash => { :success => "Signed Up and Logged In!" }
    else
      render "new"
    end
  end
end