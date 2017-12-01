class Article < ApplicationRecord
    include AASM
    #presence:true lo k va hacer es validar
    # de que no este vacio no c pueda huardar vacio
    belongs_to :user
    validates :nombre, presence: true, uniqueness: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :costo, presence: true

    #assm column: "state" do
    #   state :in_draft, initial: true
    #    state :published

     #   event :publish do
     #       transitions from: :in_draft, to: :published
     #   end
     #   event :unpublish do
     #       transitions from: :published,to: :in_draft
     #   end
    #end


end
