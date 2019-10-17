class UsersController < ApplicationController

	def index
		@users = User
      .order(created_at: :desc)
      .offset((page - 1) * per_page)
      .limit(per_page)
      .includes(:badges)

    @total_users = (User.count / per_page.to_f).ceil
	end

	def new

    @user = User.new
		
	end

	def create

		attrs = params.require(:user).permit(:name, :email, :age)
		@user = User.new(attrs)

		if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
    
	end

	def show
		@current_user = User.find(params[:id])
	end

	def edit

		@user = User.find(params[:id])
		
	end

	def update

		@user = User.find(params[:id])
		attrs = params.require(:user).permit(:name, :email, :age)

		if @user.update(attrs)
      redirect_to user_path(@user)
    else
      render :edit
    end
	end

  private

    def per_page
      5
    end

    def page
      return 1 if !params[:page]

      params[:page].to_i
    end

end





