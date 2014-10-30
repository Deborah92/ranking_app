class Result < ActiveRecord::Base
  belongs_to :exhibition
  belongs_to :award
  belongs_to :dog

  validates_presence_of :exhibition_id, :award_id, :dog_id
  STATUS = ['Pending','Validated','Rejected']
  validates_inclusion_of :status, in: STATUS

end
