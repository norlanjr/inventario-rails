class Detail < ApplicationRecord
  belongs_to :article
  belongs_to :entry
  belongs_to :stock
end
