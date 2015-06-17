class User < ActiveRecord::Base
  has_many :messages
  # converts the parameters passed in urls from id's to email addresses
  def to_param
    email
  end
  
  #extracts the email without the '.com' from the user
  def self.getEmail(user)
    emailString = user.email
    if !(defined?(emailString)).nil?
      emailString.gsub!('.', '_')
      emailString[0, emailString.length - 4] 
    end
  end
  def self.find_user_by_id(id)
    user = self.find(id)
  end
  # finds user by their extracted email address 
  def self.findUser(inputEmail)
    email = inputEmail.gsub('_', '.')
    item = self.find_by(email: email+".com")
    if !item.nil?
      item
    end
  end
  def self.get_email_by_id(id)
    user = self.find_user_by_id(id)
    self.getEmail(user)
  end
end
