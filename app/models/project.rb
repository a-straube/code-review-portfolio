class Project < ActiveRecord::Base
  has_and_belongs_to_many :skills

  validates :name, :presence => true
end
