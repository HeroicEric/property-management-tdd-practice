class Owner < ActiveRecord::Base

  has_many :buildings, dependent: :nullify

  validates :first_name, presence: true, format: { with: /[a-z]+/i }
  validates :last_name, presence: true, format: { with: /[a-z]+/i }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }

end
