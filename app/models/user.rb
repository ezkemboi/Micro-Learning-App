class User < ActiveRecord::Base
    has_secure_password
    has_many :articles

    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    # Validate inputs to users table e.g email should be unique etc.
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
    validates :email, format: {
        with: VALID_EMAIL,
        message: 'Please provide a valid email'
    }
    validates :password, length: { in: 5..10 }
end
