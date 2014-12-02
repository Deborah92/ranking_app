class Result < ActiveRecord::Base
  belongs_to :exhibition
  belongs_to :award
  belongs_to :dog

  #after_create :
  has_many :points, through: :award

  validates_presence_of :exhibition_id, :award_id, :dog_id
  STATUS = ['Pending','Validated','Rejected']
  validates_inclusion_of :status, in: STATUS
  validate :not_celebrated_exhibition

  def not_celebrated_exhibition
    if !exhibition_id.blank? and exhibition.date > Date.today
      errors.add(:exhibition, "hasn't been celebrated")
    end
  end

end
