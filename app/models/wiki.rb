include ApplicationHelper

class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  scope :visible_to, ->(user) { user ? all : where(public: true) }
    
  default_scope { order(created_at: :desc) }
  
    def private?
      self.private == true
    end
   
  # def markdown_title
  #     markdown_to_html (self.title)
  #   end
  
  #   def markdown_body
  #     markdown_to_html (self.body)
  #   end
   
   
  # def publicize
  #   update_attribute(:private, false)
  # end
  # <!--<%= link_to wiki.markdown_title, wiki %>-->
 
  
end
