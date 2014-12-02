class Award < ActiveRecord::Base
  has_many :points
  has_many :results

  validates_presence_of :award
  AWARD = ['B.I.S.','2º B.I.S.','3º B.I.S.','1º GRUPO','2ºGRUPO','3º GRUPO','MEJOR DE RAZA','BOS','CACIB','R.CACIB','RAPPEL CAC',
          'CAC','R.CAC','MEJOR JOVEN','CCJ/EXC.1 (JOVEN)']
  validates_inclusion_of :award, in: AWARD


end