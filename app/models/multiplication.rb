class Multiplication < ApplicationRecord
  validates :max_multiplicand,
            :max_multiplier,
            presence: true

  validates :max_multiplicand,
            :max_multiplier,
            numericality: { 
              only_integer: true,
              greater_than: -11,
              less_than: 11
            }

  def call
    MultiplicationWorker.perform_async(id)
    # start
  end

  def start
    multiplicand_range = max_multiplicand > 0 ? (0..max_multiplicand) : (max_multiplicand..0)
    multiplier_range = max_multiplier > 0 ? (0..max_multiplier) : (max_multiplier..0)

    sum = multiplicand_range.reduce(0) do |sum, multiplicand|
      multiplier_range.each do |multiplier|
        result = multiplicand * multiplier
        sum = sum + result
        publish(multiplicand: multiplicand, multiplier: multiplier, result: result, sum: sum)
        sleep 2
      end
      sum
    end

    update(sum: sum)
  end

  def publish(multiplicand: , multiplier: , result: , sum:)
    # ActionCable.server.broadcast(
    MultiplicationChannel.broadcast_to(
      id, 
      multiplication: { 
        multiplicand: multiplicand,
        multiplier: multiplier,
        result: result,
        sum: sum
      }
    )
  end
end