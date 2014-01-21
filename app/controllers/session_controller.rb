class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email( params[ :email ])

    if user && user.authenticate( params[ :password ]) 
      session[ :user_id ] = user.id
      redirect_to :welcome_index, :notice => "Logged In!"
    else
      flash[:error] = "Invalid email or password" if params[ :email ]
      render "new"
    end
  end

  def destroy
    if( session[ :user_id ] )
      session[ :user_id ] = nil
      redirect_to :root_url
    end
  end
end