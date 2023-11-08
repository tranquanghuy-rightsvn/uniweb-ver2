module Encrypt
  class << self
    key = ActiveSupport::KeyGenerator.new('id').generate_key('Ambcevtnm1@@', 32)
    @@crypt = ActiveSupport::MessageEncryptor.new(key)

    def encrypt string
      encrypted_string = @@crypt.encrypt_and_sign(string)

      while encrypted_string.include?("+") do
        encrypted_string = @@crypt.encrypt_and_sign(string)
      end

      encrypted_string
    end

    def decrypt string
      @@crypt.decrypt_and_verify string
    end
  end
end
