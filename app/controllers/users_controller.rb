class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

 
  def show
  end

  
  def new
    @user = User.new
    
    @is_signup = true
  end

  
  def edit
  end


  def create
    user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if user.save
      # the moment you sign up it logs  you in

      session[:user_id] = user.id
      redirect_to listings_path
    else
      redirect_to new_user_path
    end
  end
  
  
    

  def destroy
    u = User.where(id:params[:id]).first
    
    if u.id === current_user.id
    reset_session
    end
  
    u.destroy
    redirect_to new_user_path

  end

  private

    def set_user
      @user = User.find(params[:id])
    end

   
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
