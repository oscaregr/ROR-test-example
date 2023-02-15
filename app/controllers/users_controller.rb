class UsersController < ApplicationController
  skip_before_action :protect_pages, only: [:index, :new, :create]

  def index
    reset_session
    
    @user = User.find_by(name: params[:name])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:pass] = params[:password]
      redirect_to home_index_path
    end
  end

  def new
    @user = User.new()
  end

  def create
    unless user_params.nil?
      user = User.new(user_params)

      if user.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @user = user
  end

  def update
    if user.update(user_params.merge(password: session[:pass]))
      redirect_to home_index_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    user.destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :description, :password)
    end

    def user
      User.find_by(id: params[:id])
    end
end
