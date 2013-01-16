class MinecraftPlayer < ActiveRecord::Base
  before_create :generate_verification_code

private

  def generate_verification_code
    self.verification_code = SecureRandom.hex(16)
  end
end
