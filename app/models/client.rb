class Client < ApplicationRecord

  def is_best
    Client.order(cpu: :asc).first.id == id
  end

end
