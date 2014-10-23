class Point < ActiveRecord::Base
  belongs_to  :exhibition

  validates_presence_of :year, :exhibition_id, :award, :npoint


end