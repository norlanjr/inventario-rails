class Stock < ApplicationRecord
  belongs_to :article
  has_many :bill
  has_many :detail
end
