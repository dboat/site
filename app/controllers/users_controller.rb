class UsersController < ApplicationController
  before_filter :signed_in_user,  only: [:index, :edit, :show, :update]
  before_filter :admin_user,      only: [:destroy, :edit, :update, :index]
  before_filter :correct_user,    only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to UCLA Dragon Boat!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def index
    @users = User.order(:last_name)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:info] = "User deleted."
    redirect_to users_path
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      
      # remember_token is reset when user is saved, so we have to sign in user again
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      if not current_user.admin? and not current_user?(@user)
        redirect_to root_path
      end
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
