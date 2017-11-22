class Article < ApplicationRecord
    #presence:true lo k va hacer es validar
    # de que no este vacio no c pueda huardar vacio
    belongs_to :user
    validates :nombre, presence: true, uniqueness: true
    validates :descripcion, presence: true
    validates :precio, presence: true
    validates :precio2, presence: true
    validates :costo, presence: true


end
