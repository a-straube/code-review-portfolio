class Comment < ActiveRecord::Base
  belongs_to :blog

  validates :comment, :presence => true
end
