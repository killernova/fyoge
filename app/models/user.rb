class User < ApplicationRecord
  has_one :user_info
  has_secure_password
  has_and_belongs_to_many :roles
  scope :teachers, -> { joins(:roles).where('roles.name = ?', 'teacher') }
  scope :admins, -> { joins(:roles).where('roles.name = ?', 'admin') }
  scope :students, -> { joins(:roles).where('roles.name = ?', 'student') }
  attr_accessor :remember_token
  validates :mobile, presence: true, uniqueness: true, format: {
      with: /\A1[3578]{1}\d{9}\Z/
  }

  def admin?
    roles.pluck(:name).include? 'admin'
  end

  def teacher?
    roles.pluck(:name).include? 'teacher'
  end

  def student?
    roles.pluck(:name).include? 'student'
  end

  def self.digest(string)
    cost = BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def authenticate?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end
end
