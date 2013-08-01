require_relative '../../db/config'
require 'time'

class Student < ActiveRecord::Base
# implement your Student model here

  attr_accessor :first_name, :last_name, :birthday, :email, :phone, :gender

  validates :age, numericality: { only_integer: true,
                                  greater_than: 4    }
  validates :email, format: { with: /.+@.+[.].{2,}/,
    message: "wrong format, biatch"}
  validates :email, :uniqueness => true 
  validate :lemme_get_yo_numba

  # def initialize(options = {})
  #   self.first_name = options[:first_name]
  #   self.last_name = options[:last_name]
  #   self.birthday = options[:birthday]
  #   self.email = options[:email]
  #   self.phone = options[:phone]
  #   self.gender = options[:gender]
  # end
  def lemme_get_yo_numba
    errors.add(:phone, "yo digits aint rite") if
     phone.gsub(/\D/, "").length < 10
  end

  def name
    "#{first_name} #{last_name}"
  end

  def age
    (Date.today - birthday).to_i/365    
  end

end
