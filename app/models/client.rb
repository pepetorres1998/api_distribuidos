class Client < ApplicationRecord

  scope :not_expired, lambda { where("updated_at > ?", 3.seconds.ago) }
  def is_best
    Client.order(cpu: :asc).not_expired.first.id == id
  end

  def clients
    if is_best
      Client.order(ranking: :asc).not_expired
    else
      [self]
    end
  end

  def get_ranking
    ranking = 750 + (cpu.to_f*250 + ram.to_f*500)
    return ranking.to_i
  end

end
