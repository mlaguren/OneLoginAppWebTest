class User

  def initialize
    @first=Faker::Name.first_name
    @last=Faker::Name.last_name
    @company="OneLogin Test"
    @phone=Faker::PhoneNumber.phone_number
  end

  def first_name
    return @first
  end

  def last_name
    return @last
  end

  def company
    return @company
  end  

  def email
    @email_address = "#{@first.downcase}.#{@last.downcase}.65797ea4@clickity.me"
    return @email_address  
  end

  def phone 
    return @phone
  end
  
  def to_json
    {'first'=>@first, 'last' => @last, 'company' => 'OneLogin Test', 'password' => :null, 'email' => @email_address, 'phone' => @phone}.to_json
  end
end  
    
