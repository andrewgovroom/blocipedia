class ChargesController < ApplicationController
    
    after_action :make_premium, only: :create
    
    

   def create
       # Creates a Stripe Customer object, for associating
       # with the charge
       customer = Stripe::Customer.create(
         email: current_user.email,
         card: params[:stripeToken]
       )
     
       # Where the real magic happens
         charge = Stripe::Charge.create(
         customer: customer.id, # Note -- this is NOT the user_id in your app
         amount: 15_00,
         description: "Blocipedia Premium Account - #{current_user.email}",
         currency: 'usd'
       )
     
       flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
       redirect_to root_path(current_user) # or wherever
     
       # Stripe will send back CardErrors, with friendly messages
       # when something goes wrong.
       # This `rescue block` catches and displays those errors.
       rescue Stripe::CardError => e
         flash[:alert] = e.message
         redirect_to new_charge_path
   end
 
 
 
   def new
     @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Blocipedia Premium Account - #{current_user.email}",
     amount: 15_00
     }

   end
 
  
  private
    
    def make_premium
     current_user.update_attribute(:role, 'premium')
     current_user.save!
    end
    
    
    
    
end
