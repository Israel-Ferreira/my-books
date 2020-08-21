class Admin::UsersController < AdminController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :verify_password, only: %i[update]

  def index 
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)

    if @user.save! 
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def show; end 

  def update 
    if @user.update!(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit 
    end
  end

  def destroy 
    if @user.destroy! 
      redirect_to admin_users_path
    else
      render :index
    end
  end

  def admins
    @users = User.admins.order(created_at: :desc).page(params[:page])
  end


  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :admin)
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

end
