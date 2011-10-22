class User
  include Mongoid::Document
  field :username
  field :name, :type => String
  field :password, :type => String
  
  key :username
  
  validates_presence_of :username, :name, :password
  embeds_many :habits
end
