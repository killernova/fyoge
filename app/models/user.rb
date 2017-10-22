class User < ApplicationRecord
  has_one :user_info
  has_secure_password
  has_and_belongs_to_many :roles
  scope :teachers, -> { joins(:roles).where('roles.name = ?', 'teacher') }
  scope :admins, -> { joins(:roles).where('roles.name = ?', 'admin') }
  scope :students, -> { joins(:roles).where('roles.name = ?', 'student') }

  def admin?
    roles.pluck(:name).include? 'admin'
  end

  def teacher?
    roles.pluck(:name).include? 'teacher'
  end

  def student?
    roles.pluck(:name).include? 'student'
  end
end
