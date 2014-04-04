class Building < ActiveRecord::Base

  belongs_to :owner

  validates :street_address, presence: true, uniqueness: true
  validates :state, presence: true, format: { with: /[a-z]+/i }
  validates :city, presence: true, format: { with: /[a-z]+/i }
  validates :postal_code, presence: true, format: { with: /[0-9]+/i }, length: { minimum: 5, maximum: 5}

end
