class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :detail_invoice, dependent: :destroy # Se tiene que especificar que la relacion puede eleminarse, de lo contrario te da un error

end
