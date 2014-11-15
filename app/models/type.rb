class Type < ActiveRecord::Base
  has_many :exhibitions
  has_many :points

  has_many :results, through: :exhibitions

  validates_presence_of :name
  self.inheritance_column = nil

  TYPE = ['MONOGRÁFICA NACIONAL','CONCURSO MONOGRÁFICO NACIONAL O REGIONAL','Especial A.E.F.R.B.F.','Punto Obligatorio',
          'EXPOSICIÓN INTERNACIONAL','EXPOSICIÓN NACIONAL']
  validates_inclusion_of :name, in: TYPE

end
