class Article < ApplicationRecord
    #presence:true lo k va hacer es validar
    # de que no este vacio no c pueda huardar vacio
    validates :nombre, presence: true, uniqueness: true
    validates :precio, presence: true
end
