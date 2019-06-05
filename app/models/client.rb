class Client < ApplicationRecord

  def is_best
    Client.order(cpu: :asc).first.id == id
  end

  def clients
    if is_best
      Client.order(cpu: :asc)
    else
      [self]
    end
  end

end
