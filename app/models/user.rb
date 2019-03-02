class User < ActiveRecord::Base
  validates :name, :password, :balance, presence: true
end

