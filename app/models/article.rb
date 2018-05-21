class Article < ApplicationRecord
    include AASM
    #presence:true lo k va hacer es validar
    # de que no este vacio no c pueda huardar vacio
    belongs_to :user
    has_many :stock
    validates :nombre, presence: true, uniqueness: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :costo, presence: true
    after_save :añadir_registro

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
    private 
    def añadir_registro
        stock.create!(article_id: id,existencia: cantidad,existencia_minima: 0)
    end

end
