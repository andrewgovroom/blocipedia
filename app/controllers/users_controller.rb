class UsersController < ApplicationController
  
    def show
      if current_user.present?
        @user = params[:id] ? User.find(params[:id]) : current_user
      else
        redirect_to root_path
      end
    end
      
    def index
      @users = User.all
    end
    
    def new
      @user = User.new
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def update
      if current_user.update_attributes(user_params)
        flash[:notice] = "User account downgraded"
        redirect_to root_path
      else
        flash[:error] = "Invalid user info"
        redirect_to root_path
      end
    end
   
     def downgrade
      @user = User.find(params[:id])
      @user.role = 'standard'
  
      if @user.save
        flash[:notice] = "You've been downgraded to standard. Your private wikis are now public."
        redirect_to :back
      else
        flash[:error] = "There was an error creating your account. Please try again."
        redirect_to :back
      end
  
      @user_wikis = @user.wikis.where(private: true)
  
      @user_wikis.each do |makepub|
        makepub.update_attributes(private: false)
      end
    end
   
   
   
     private
   
     def user_params
       params.require(:user).permit(:email, :role)
     end

 
    
    
end
