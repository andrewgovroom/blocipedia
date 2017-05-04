class Wiki < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, ->(user) { user ? all : where(public: true) }
    
  default_scope { order(created_at: :desc) }
  
  def private?
    self.private == true
  end
 
 private
 
   def make_public
     self.private = false
   end
  
    
end
