module Auth
  require 'bcrypt'
 
  def create_hash_digest(password)
    BCrypt::Password.create(password)
  end
 
  def verify_hash_digest(password)
    BCrypt::Password.new(password)
  end
 
  def create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end
 
  def authenticate_user(email, password, list_of_users)
    user = list_of_users[email]
    if user.email == email && verify_hash_digest(user.password) == password
      return user
    end
    "Credentials were not correct"
  end
end