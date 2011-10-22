class Habit
  include Mongoid::Document
  field :name, :type => String
  
  validates_presence_of :name 
  embedded_in :user, :inverse_of => :habits
  embeds_many :metrics
end
