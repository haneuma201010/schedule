class StudentUser < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  # validates(:name, {presence: true, length: { maximum:50 }})←省略無しで書くとこうなる？？(多分)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false } # case_sensitiveは大文字小文字関係なく同じメールアドレスとしてみなす。
                     
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
