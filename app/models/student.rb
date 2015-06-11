class Student < ActiveRecord::Base
  has_many :grades
  has_many :parents
  belongs_to :teacher
  has_secure_password
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
end
