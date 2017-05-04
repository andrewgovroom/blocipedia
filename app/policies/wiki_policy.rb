class WikiPolicy < ApplicationPolicy
    
    def show
        wiki.public? || user.present?
    end

end 