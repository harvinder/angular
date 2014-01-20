class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  validates_presence_of :first_name, :last_name, :on => :create
  validates_uniqueness_of :email
  has_secure_password
end
