class Exhibition < ActiveRecord::Base
  belongs_to :type
  has_many :results, :dependent => :destroy

  validates_presence_of :name, :date, :type_id
  #self.inheritance_column = nil
  #validate :past_date
  #TYPE = ['MONOGRÁFICA NACIONAL','CONCURSO MONOGRÁFICO NACIONAL O REGIONAL','Especial A.E.F.R.B.F.','Punto Obligatorio',
  #        'EXPOSICIÓN INTERNACIONAL','EXPOSICIÓN NACIONAL']
  #validates_inclusion_of :type, in: TYPE

  #def past_date
  #  if !date.blank? and date < Date.today
  #    errors.add(:date, "can not be at the past")
  #  end
  #end
end
