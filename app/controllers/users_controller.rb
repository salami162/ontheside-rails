class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # GET /users/new
  # return a form to create a user.
  def new
  end

  # POST /users
  # create a new user.
  def create
    # render text: params[:user].inspect #render the input params value
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :action => "new"
    end
  end

  # GET /users/:id(.:format)
  # show a speific user
  def show
    @user = User.find(params[:id])
    logger.debug('find user : #{@user}')
  end

  # GET /users/:id for edit
  # show a specific user in form
  def edit
    @user = User.find(params[:id])
    logger.debug('find user : #{@user}')
  end

  # PUT /users/:id
  # udpate a specific user info
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to @user
    else
      render :action => 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :about)
  end  
end
