class Point < ActiveRecord::Base
  belongs_to  :type
  belongs_to  :award


  #has_many :exhibitions, through: :type
  #has_many :results, through: :exhibitions
  #has_many :types, through: :exhibitions
  #has_many :results, through: :types
  has_many :results, through: :award
  #has_many :dogs, through: :results

  validates_presence_of :year, :type_id, :award_id, :npoint

  def self.search(val)
    if val[:exhibition] != ""
      e = Exhibition.where(id: val[:exhibition]).uniq.pluck(:type_id)
      where("type_id = ?", "#{e[0]}").select(:award_id)
    end
  end

end
