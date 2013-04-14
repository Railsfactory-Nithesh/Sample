  require 'digest/sha2'
  class User < ActiveRecord::Base
    attr_accessible :hashed_password, :salt, :username,:password,:password_confirmation
    validates :username, :presence => true, :uniqueness => true
    validates :password, :confirmation => true
    attr_accessor :password_confirmation
    attr_reader :password
    validate :password_must_be_present
    class << self
      def authenticate(name, password)
        p 33333333333333333333
        p name
        p 4444444444
        p password
        p 55555555
        if user = find_by_username(name)
          p 11111111111
          p user
          p 222222222
          if user.hashed_password == encrypt_password(password, user.salt)
          user
          end
        end
      end
      def encrypt_password(password, salt)
        Digest::SHA2.hexdigest(password + "wibble" + salt)
      end
    end
    # 'password' is a virtual attribute
      def password=(password)
        @password = password
          if password.present?
          generate_salt
          self.hashed_password = self.class.encrypt_password(password, salt)
        end
      end
      private
      def password_must_be_present
        errors.add(:password, "Missing password" ) unless hashed_password.present?
      end
      def generate_salt
        self.salt = self.object_id.to_s + rand.to_s
      end
end