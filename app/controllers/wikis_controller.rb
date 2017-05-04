class WikisController < ApplicationController
  
  
  
  def index
  
    @wiki = Wiki.visible_to(current_user)
    authorize @wiki
 
  end


    def show
        @wiki = Wiki.find(params[:id])
        unless (@wiki.private == false) || (@wiki.private == nil) || current_user.premium? || current_user.admin?
            flash[:alert] = "Only premium user can view private topics."
            if current_user
              redirect_to new_charge_path
            else
              redirect_to new_user_registration_path
            end
        end
      end



  def new
    @wiki = Wiki.new
    authorize @wiki
  end
  
  
  def create

     
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user
    authorize @wiki
   

     if @wiki.save

      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
     else
 
      flash.now[:alert] = "There was an error saving the Wiki. Please try again."
      render :new
     end
  end
  
 
  
  
  def edit
     @wiki = Wiki.find(params[:id])
     authorize @wiki
  end
  
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    authorize @wiki
 
     if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
     else
      flash.now[:alert] = "There was an error saving the Wiki. Please try again."
      render :edit
     end
  end
  
  
  def destroy
     @wiki = Wiki.find(params[:id])
     authorize @wiki
 

     if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wiki_user
     else
      flash.now[:alert] = "There was an error deleting the Wiki."
      render :show
     end
  end
  
 
  
end
