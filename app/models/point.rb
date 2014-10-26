class Point < ActiveRecord::Base
  belongs_to  :type
  belongs_to  :award

  validates_presence_of :year, :type_id, :award_id, :npoint


end