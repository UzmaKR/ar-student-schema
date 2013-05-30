require_relative '../../db/config'
# require 'date'
class Student < ActiveRecord::Base

  validates_format_of :email, :with => /\w+@\w+.\w{2,}/
  validates :email, :uniqueness => true
  #validates :age, numericality 
  validate :age_cannot_be_under_five_years
  validates_format_of :phone, :with => /.\d{3}.\s\d{3}.?\d{4}/
  # attr_reader :first_name, :last_name, :birthday, :name

  # def initialize(*args)
  #   @first_name = args[:first_name]
  #   @last_name  = args[:last_name]
  #   @gender     = args[:gender]
  #   @birthday   = args[:birthday]
  #   @email      = args[:email]
  #   @phone      = args[:phone]
  # end


# implement your Student model here
  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    (now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1))
  end

  private
  def age_cannot_be_under_five_years
    errors.add(:birthday, "cannot be less than 5yrs ago!") if self.age < 5
  end


end

