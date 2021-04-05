class UsersController < ApplicationController
    
    def show
       @user = User.find(params[:id])
       @articles = @user.articles
    end 
   
    def new
        @user = User.new
    end
    
    def edit 
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Dat account got updated doe bruh"
            redirect_to articles_path
        else 
            render 'edit'
        end 
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to DAT Alpha Blog #{@user.username}. BRUH, you be is successfully signed up MANE!"
            redirect_to articles_path
        else
            render 'new'
        end 
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
    
end 