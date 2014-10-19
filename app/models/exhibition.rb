class Exhibition < ActiveRecord::Base
  validates_presence_of :name, :date, :type
  self.inheritance_column = nil
  validate :past_date

  def past_date
    if !date.blank? and date < Date.today
      errors.add(:date, "can not be at the past")
    end
  end
end
