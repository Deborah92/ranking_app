class Exhibition < ActiveRecord::Base
  validates_presence_of :name, :date, :type
  self.inheritance_column = nil
  validate :past_date
  TYPE = ['B.I.S.','2º B.I.S.','3º B.I.S.','1º GRUPO','2º GRUPO','3º GRUPO','MEJOR RAZA','BOS','CACIB',
          'R.CACIB','RAPPEL CAC','CAC','R.CAC','MEJOR JOVEN','CCJ/EXC.1(JOVEN)']
  validates_inclusion_of :type, in: TYPE

  def past_date
    if !date.blank? and date < Date.today
      errors.add(:date, "can not be at the past")
    end
  end
end
