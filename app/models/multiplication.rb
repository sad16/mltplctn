class Multiplication < ApplicationRecord
  validates :multiplicand,
            :multiplier,
            presence: true

  validates :multiplicand,
            :multiplier,
            numericality: { 
              only_integer: true,
              other_than: 0,
              greater_than: -11,
              less_than: 11
            }

  def call
    unless Rails.env.development?
      MultiplicationWorker.perform_async(id)
    else
      MultiplicationWorker.new.perform(id)
    end
  end

  def start
    multiplicand_range = multiplicand > 0 ? (1..multiplicand) : (multiplicand..-1)
    multiplier_range = multiplier > 0 ? (1..multiplier) : (multiplier..-1)

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