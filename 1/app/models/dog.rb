class Dog < ActiveRecord::Base
  validates_presence_of :name, :birth_date
  validate :future_birth_date
  SEX = ['male', 'female']
  validates_inclusion_of :sex, in: SEX

  validates_format_of :birth_date, with:  /[[19|20]+[0-9]+[0-9]]+-[0-9|1[0-2]]+-[[0-2+0-9]|3[0-1]]/, message: 'Birth date must be a valid date'
  def future_birth_date
    if !birth_date.blank? and birth_date > Date.today
      errors.add(:birth_date, "can not be in the future")
    end
  end

end

