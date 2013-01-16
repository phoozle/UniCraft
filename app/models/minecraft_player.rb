class MinecraftPlayer < ActiveRecord::Base
  before_create :generate_verification_code

  validates :username, :presence => true, :on => :create
  validates :email, :presence => true, :on => :create

  validates :email, :uniqueness => true

  def active?
    active
  end

  def activate!
    update_attributes(:active => true, :verification_code => nil)
  end

  def deactivate!
    update_attributes(:active => false)
  end

private

  def generate_verification_code
    self.verification_code = SecureRandom.hex(16)
  end
end
