class Client < ApplicationRecord
  has_many :bills

  # Agregar al usuario el método deuda
  # Para saber la deuda actual de un usuario se hace lo siguiente
  # @user.deuda
  # y daría el total de las deuda actual
  def deuda
    total = 0
    self.bills.each do |bill|
      total += bill.total
    end

    return total
  end

  # Este método retorna Verdadero si el cliente aun tiene suficiente
  # cŕedito
  def queda_credito?
    if self.deuda < self.credito
      return true
    else
      return false
    end
  end

end
