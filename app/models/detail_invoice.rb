class DetailInvoice < ApplicationRecord
  
  belongs_to :article
  belongs_to :bill
end
