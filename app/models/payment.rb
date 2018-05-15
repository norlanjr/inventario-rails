class Payment < ApplicationRecord
  belongs_to :bill, dependent: :destroy
end
