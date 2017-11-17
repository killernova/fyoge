class User < ApplicationRecord
  has_one :user_info
  has_secure_password validations: false
  has_and_belongs_to_many :roles
  scope :teachers, -> { joins(:roles).where('roles.name = ?', 'teacher') }
  scope :admins, -> { joins(:roles).where('roles.name = ?', 'admin') }
  scope :students, -> { joins(:roles).where('roles.name = ?', 'student') }
  include SoftDelete
  attr_accessor :remember_token, :role_id
  default_scope -> { where(soft_delete: false) }
  before_create :set_role, if: -> { roles.blank? }
  validates :mobile, allow_blank: true, uniqueness: true, format: {
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

  def role_id
    roles.where.not(name: 'admin').ids.first
  end

  def role_id=(value)
    return set_role if value.blank?
    role = Role.find(value)
    return if role.name == 'admin'
    roles.destroy_all
    roles << Role.find(value)
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

  private

  def set_role
    roles << Role.find_by(name: 'student')
  end

end
