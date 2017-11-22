class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  has_many :details
end
