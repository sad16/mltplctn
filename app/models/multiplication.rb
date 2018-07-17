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
    if Rails.env.development?
      MultiplicationWorker.new.perform(id)
    else
      MultiplicationWorker.perform_async(id)
    end
  end

  def start
    multiplicand_range = max_multiplicand > 0 ? (1..max_multiplicand) : (max_multiplicand..-1)
    multiplier_range = max_multiplier > 0 ? (1..max_multiplier) : (max_multiplier..-1)

    sum = multiplicand_range.reduce(0) do |sum, multiplicand|
      multiplier_range.each do |multiplier|
        result = multiplicand * multiplier
        sum = sum + result
        publish(multiplicand: multiplicand, multiplier: multiplier, result: result, sum: sum)
        sleep 0.5
      end
      sum
    end

    update(sum: sum)
  end

  def publish(multiplicand: , multiplier: , result: , sum:)
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