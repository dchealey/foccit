class User < ActiveRecord::Base
   before_save { self.email = email.downcase if email.present? }
   before_save { self.name = self.name.split.map!{|n| n.capitalize}.join(' ') if self.name }

   NAME_REGEX = /\A[A-Z]\w+(\s[A-Z]\w+)?\z/

   validates :name, length: { minimum: 1, maximum: 100 }, format: { with: NAME_REGEX }, presence: true
   validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
   validates :password, length: { minimum: 6 }, allow_blank: true
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

    has_secure_password
end
