class Metric
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :observation_record, :type => Hash
  
  validates_presence_of :name, :type, :allow_nil => false
  embedded_in :habit, :inverse_of => :metrics
end
