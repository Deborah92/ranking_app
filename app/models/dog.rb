class Dog < ActiveRecord::Base
  belongs_to  :user
  has_many :results

  validates_presence_of :name, :birth_date
  validate :future_birth_date
  SEX = ['male', 'female']
  validates_inclusion_of :sex, in: SEX

  def future_birth_date
    if !birth_date.blank? and birth_date > Date.today
      errors.add(:birth_date, "can not be in the future")
    end
  end

end

