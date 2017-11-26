class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  has_many :details, dependent: :destroy # Se tiene que especificar que la relacion puede eleminarse, de lo contrario te da un error
end
