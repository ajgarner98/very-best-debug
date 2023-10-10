class UsersController < ApplicationController


  def index
    @users = User.all.order({:created_at => :desc})

    render({ :template => "user_templates/index"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/show"})
  end
  
  def create
    a_user = User.new
    a_user.username = params.fetch("query_username")
    a_user.save
    
    redirect_to("/users/#{a_user.username}")
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)
    
    the_user.username = params.fetch("query_username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end

end
