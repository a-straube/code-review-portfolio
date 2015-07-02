class Project < ActiveRecord::Base
  belongs_to :skills

  validates :name, :presence => true
end
