require "spec_helper"

describe User  do 
  
  describe ".full_name" do
    
    it "includes first_name if it exists" do
      user = User.new(first_name: "Kelsey",
        last_name: "Hannan",
        email: "khannan@uvic.ca")
      expect(user.full_name).to include ("Kelsey")
    end

    it "includes last_name if it exists" do
      user = User.new(first_name: "Kelsey",
                      last_name: "Hannan",
                      email: "khannan@uvic.ca")
      expect(user.full_name).to include ("Hannan")
    end
    
  end

end