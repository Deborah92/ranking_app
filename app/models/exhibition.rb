class Exhibition < ActiveRecord::Base
  has_many :point
  validates_presence_of :name, :date, :type
  self.inheritance_column = nil
  validate :past_date
  TYPE = ['MONOGRÁFICA NACIONAL','CONCURSO MONOGRÁFICO NACIONAL O REGIONAL','Especial A.E.F.R.B.F.','Punto Obligatorio',
          'EXPOSICIÓN INTERNACIONAL','EXPOSICION NACIONAL']
  validates_inclusion_of :type, in: TYPE

  def past_date
    if !date.blank? and date < Date.today
      errors.add(:date, "can not be at the past")
    end
  end
end
