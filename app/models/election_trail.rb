class ElectionTrail < Trail
    belongs_to :election

    
    def format
        response = "#{self.user.email} #{self.action} #{self.entity} with #{self.modified_attributes}"
    end
end