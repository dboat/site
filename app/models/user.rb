class User < ActiveRecord::Base
  attr_accessible :name, :email, :phone
end
